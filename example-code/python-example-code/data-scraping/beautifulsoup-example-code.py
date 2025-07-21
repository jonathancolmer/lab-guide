from bs4 import BeautifulSoup

# Example HTML 
html = """
<html>
    <body>
        <h1>Ranking of Classical Composers</h1>
        <table>
            <thead>
                <tr>
                    <th>Rank</th>
                    <th>Composer</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Gustav Mahler</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Maurice Ravel</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Antonin Dvorak</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>Claude Debussy</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>Sergei Prokofiev</td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
"""

# Parse sample HTML
soup = BeautifulSoup(html, "html.parser")

# Extract the page title
title = soup.find("h1").get_text()
print(f"=== {title} ===\n")

# Method 1: Extract data from the table - Most structured approach
# This method navigates through the HTML table hierarchy step by step
table = soup.find("table")  # Find the first <table> element in the document
if table:  # Check if table exists before proceeding (defensive programming)
    # Find all rows in the tbody (skip header)
    # tbody contains the data rows, while thead contains column headers
    tbody = table.find("tbody")  # Get the table body section
    rows = tbody.find_all("tr")  # Find all table row (<tr>) elements within tbody
    
    # Loop through each data row in the table
    for row in rows:
        # Extract all table data cells (<td>) from the current row
        cells = row.find_all("td")
        
        # Ensure we have at least 2 cells (rank and composer) before processing
        if len(cells) >= 2:  # Defensive check to prevent index errors
            # Extract text from first cell (rank) and remove extra whitespace
            rank = cells[0].get_text(strip=True)  # get_text() extracts text content
            # Extract text from second cell (composer name) and clean whitespace
            composer = cells[1].get_text(strip=True)  # strip=True removes leading/trailing spaces
            # Display the formatted ranking information
            print(f"#{rank}: {composer}")

# Alternative method: Find all table rows and extract data
# This method is more direct but less structured than Method 1
print("\n=== Alternative Extraction Method ===")
all_rows = soup.find_all("tr")  # Find ALL <tr> elements in the entire document
for row in all_rows[1:]:  # Skip the first row (index 0) which is the header row
    # Extract all table data cells from current row
    cells = row.find_all("td")  # Look for <td> elements (data cells, not headers)
    
    # Only process rows that contain data cells (not header cells with <th>)
    if cells:  # This checks if the list is not empty
        # Use .text property instead of .get_text() - both work similarly
        rank = cells[0].text.strip()  # .text is shorthand for .get_text()
        composer = cells[1].text.strip()  # .strip() removes whitespace
        # Display with different formatting to show this is the alternative method
        print(f"Rank {rank}: {composer}")

# Method 3: Using CSS selectors - Most concise and powerful approach
# CSS selectors allow you to target elements using CSS-style syntax
print("\n=== Using CSS Selectors ===")
# Select all <tr> elements that are children of <tbody>
composer_rows = soup.select("tbody tr")  # CSS selector: "parent child"
for row in composer_rows:
    # Use nth-child() to select specific column positions
    # nth-child(1) = first column, nth-child(2) = second column
    rank = row.select_one("td:nth-child(1)").text.strip()  # First <td> in the row
    composer = row.select_one("td:nth-child(2)").text.strip()  # Second <td> in the row
    # Display with numbered format to distinguish from other methods
    print(f"{rank}. {composer}")

# Key differences between the methods:
# Method 1: Most explicit and structured - good for learning
# Method 2: More direct but relies on row order - can be fragile
# Method 3: Most powerful and flexible - CSS selectors are very precise