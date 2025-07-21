import requests
from bs4 import BeautifulSoup

# Step 1: Create a session and set headers
session = requests.Session()
session.headers.update({
    "User-Agent": "Mozilla/5.0",
    "Accept-Language": "en-US,en;q=0.9"
})

# Step 2: Define the target URL
url = "https://www.scrapethissite.com/pages/simple/"

try:
    # Step 3: Send GET request
    response = session.get(url, timeout=10)
    response.raise_for_status()  # Raises an HTTPError for bad responses (4xx or 5xx)

    # Step 4: Parse HTML and extract data
    soup = BeautifulSoup(response.text, "html.parser")
    countries = soup.find_all("div", class_="country")

    for country in countries:
        name = country.find("h3", class_="country-name").text.strip()
        capital = country.find("span", class_="country-capital").text.strip()
        print(f"{name} – Capital: {capital}")

except requests.exceptions.HTTPError as e:
    print(f"HTTP error occurred: {e}")
except requests.exceptions.Timeout:
    print("The request timed out.")
except requests.exceptions.RequestException as e:
    print(f"Request failed: {e}")
