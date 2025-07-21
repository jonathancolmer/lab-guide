# Import necessary Selenium modules
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
import time

# Set up the Chrome WebDriver
# Make sure ChromeDriver is installed and on your system PATH
service = Service()  # Can specify path: Service(executable_path="path/to/chromedriver")
options = webdriver.ChromeOptions()
options.add_argument("--headless")  # Optional: run in headless mode (no browser window)

# Create a browser session
driver = webdriver.Chrome(service=service, options=options)

# Load the webpage
url = "https://www.scrapethissite.com/pages/simple/"
driver.get(url)

# Optional: Wait for the page to fully load
time.sleep(2)  # Not strictly necessary here, but useful on slower connections or JS-heavy pages

# Find all elements that contain country info
# Each country is inside a <div class="col-md-4 country">
countries = driver.find_elements(By.CLASS_NAME, "country")

# Loop through each country block and extract info
for country in countries:
    name = country.find_element(By.CLASS_NAME, "country-name").text.strip()
    capital = country.find_element(By.CLASS_NAME, "country-capital").text.strip()
    print(f"{name} – Capital: {capital}")

# Close the browser session
driver.quit()
