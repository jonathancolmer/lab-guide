# This is sample code for a master script that can be used to run all 
# R files in a project, in order. This code was taken from the RTA-wildfires
# master script.

# Install & load packages
if (!requireNamespace("pacman", quietly=TRUE)) install.packages("pacman")
pacman::p_load(
  tidyverse, sf, raster, terra, here, lubridate, glue, purrr
)

# ─────────────────────────────────────────────────────────────────────────────
# User-defined settings:
# Specify here any values you might want to change,
# so that individual scripts can refer to them via config$var_name
# without having to edit those scripts directly. 
# ─────────────────────────────────────────────────────────────────────────────
config <- list(
  event_name       = "OK_Fire",
  dates            = seq(ymd("2025-03-14"), ymd("2025-03-20"), by = "day"),
  state_abb        = "OK",
  county_fps       = c("071","103","113","117","143","147"),
  area_of_interest = "County",
  clustering       = list(eps = 0.03, minPts = 2)
)

# ─────────────────────────────────────────────────────────────────────────────
# Switching directories by user
# ─────────────────────────────────────────────────────────────────────────────
username <- Sys.info()[["user"]]

# Set the main directory according to the username.
# Update the cases below with your own paths for each project. 
main_dir <- switch(username,
                   "kwv4pt" = "C:/Users/kwv4pt/The Lab Dropbox/Kate Bachman", 
                   "user1"  = "/Path/To/Your/Main_Directory/for_User1/",  
                   "user2"  = "/Path/To/Your/Main_Directory/for_User2/",
                   
                   # If your username is not listed above, the following prompt will show:
                   {
                     warning("Unknown user. Please set the main directory manually.") 
                     readline(prompt = "Enter the main directory path: ")
                   }
)


# Set the code directory to the folder containing your scripts
code_dir <- switch(username,
                   "kwv4pt" = "C:/Users/kwv4pt/The Lab Dropbox/Kate Bachman/Mozambique Carbon Tax/Code",
                   "user2" = "/Path/To/Your/Code_Directory/for_User2/", 
                   {
                     warning("Unknown user. Please set the code directory manually.")
                     readline(prompt = "Enter the code directory path: ")
                   }
)


# Establish the data and output directories using the main directory
data_dir <- file.path(main_dir, "Data")
out_dir  <- file.path(main_dir, "Output")

# ─────────────────────────────────────────────────────────────────────────────
# Load shared utility functions into the session
#
# This block searches your project’s code directory for any R scripts
# whose names start with “00_” or “01_” (convention for low-level
# helper functions and configuration scripts) and then sources each
# one in turn. 
# ─────────────────────────────────────────────────────────────────────────────
fs::dir_ls(code_dir, regexp = "^(00|01)_.*\\.R$") %>%
  walk(~ source(.x))

# ─────────────────────────────────────────────────────────────────────────────
# 04-workflow: Sequentially execute analysis modules
#
#   1. Defines a list of modules, each corresponding to an R script
#   2. Creates a helper function `run_module()` that:
#      • Constructs the script path from the module name,
#      • Prints start and finish messages,
#      • Wraps `source()` in `tryCatch()` to capture errors without stopping the loop.
#   3. Iterates over each module so your entire pipeline runs end-to-end.
# ─────────────────────────────────────────────────────────────────────────────

# List of modules (script filenames without “.R”) to run, in order:
modules <- c(
  "reading_data",       # 01: load raw data into R
  "processing_eif",     # 02: compute Environmental Inequality Fund metrics
  "fire_income_race",   # 03: merge fire data with income & race demographics
  "evac_data",          # 04: prepare evacuation variables
  "time_series_plots"   # 05: generate final plots for time-series analysis
)

# Helper function to run a single module by name
run_module <- function(name) {
  # Build full path to the script file
  script <- file.path(code_dir, glue::glue("{name}.R"))
  
  # Inform the user which module is starting
  message("Running module: ", name)
  
  # Try sourcing the script; on error, emit a warning and continue
  tryCatch(
    source(script),
    error = function(e) {
      warning("Module '", name, "' failed with error: ", e$message)
    }
  )
  
  # Inform the user the module has finished (whether success or failure)
  message("Finished module: ", name)
}

# Loop over all modules and run them in sequence
purrr::walk(modules, run_module)

# ─────────────────────────────────────────────────────────────────────────────
# 05-wrap-up: Save final workspace and session information
#
# This section saves your entire R environment to an .RData file so you can 
# reload it later exactly as it was at the end of this run. It also records 
# your session details into a plain-text log for reproducibility and debugging.
# ─────────────────────────────────────────────────────────────────────────────

# Save the full R workspace
save.image(                               # Save everything in global environment
  file.path(
    out_dir,
    glue::glue("{config$event_name}_final.RData")
  )
)

# Write session information to a text file
writeLines(
  capture.output(sessionInfo()),          # Capture session info
  file.path(out_dir, "sessionInfo.txt")   # Write session info into out_dir
)


