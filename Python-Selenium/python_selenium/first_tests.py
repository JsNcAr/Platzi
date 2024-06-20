import pytest
from selenium import webdriver
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium.webdriver.firefox.service import Service as FirefoxService


@pytest.fixture(scope="class")
def firefox_driver():
    options = FirefoxOptions()
    options.add_argument("--headless")
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')

    geckodriver_path = '/snap/bin/geckodriver'
    service = FirefoxService(geckodriver_path)

    driver = webdriver.Firefox(options=options, service=service)
    driver.implicitly_wait(5)

    yield driver

    driver.quit()


@pytest.mark.usefixtures("firefox_driver")
class TestHelloWorld:

    def test_hello_world(self, firefox_driver):
        firefox_driver.get("https://www.platzi.com")

    def test_visit_wikipedia(self, firefox_driver):
        firefox_driver.get("https://www.wikipedia.org")
        title = firefox_driver.title
        print(title)


# pytest ./python_selenium/first_tests.py --html=reports/first_tests.html --verbosity=2
