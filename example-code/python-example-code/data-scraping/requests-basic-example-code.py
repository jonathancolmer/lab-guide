import requests
from bs4 import BeautifulSoup

# Step 1: Send a GET request to the website
url = "https://www.scrapethissite.com/pages/simple/"
response = requests.get(url)

# Step 2: Check if the request was successful (status code 200)
if response.status_code == 200:
    # Step 3: Parse the HTML content
    soup = BeautifulSoup(response.text, "html.parser")

    # Step 4: Find all country blocks
    countries = soup.find_all("div", class_="country")

    # Step 5: Extract and print name + capital from each country
    for country in countries:
        name = country.find("h3", class_="country-name").text.strip()
        capital = country.find("span", class_="country-capital").text.strip()
        print(f"{name} – Capital: {capital}")
else:
    print(f"Request failed with status code {response.status_code}")
