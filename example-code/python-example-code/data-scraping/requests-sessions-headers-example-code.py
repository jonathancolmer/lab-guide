import requests
from bs4 import BeautifulSoup

# Step 1: Create a session object
session = requests.Session()

# Step 2: Define headers to mimic a real browser
session.headers.update({
    "User-Agent": "Mozilla/5.0",
    "Accept-Language": "en-US,en;q=0.9"
})

# Step 3: Send a GET request through the session
url = "https://www.scrapethissite.com/pages/simple/"
response = session.get(url)

# Step 4: Parse and extract data if the request was successful
if response.ok:
    soup = BeautifulSoup(response.text, "html.parser")
    countries = soup.find_all("div", class_="country")

    for country in countries:
        name = country.find("h3", class_="country-name").text.strip()
        capital = country.find("span", class_="country-capital").text.strip()
        print(f"{name} – Capital: {capital}")
else:
    print("Error:", response.status_code)
