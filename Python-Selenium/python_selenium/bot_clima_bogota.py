import pytest
import os
import time
import datetime
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium.webdriver.firefox.service import Service as FirefoxService


@pytest.fixture(scope="class")
def firefox_driver():
    options = FirefoxOptions()
    options.add_argument("--headless")
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--disable-blink-features=AutomationControlled')
    # Set download path
    options.set_preference("browser.download.folderList", 2)
    options.set_preference(
        "browser.download.dir",
        "/home/ramsus/Programing/Platzi/Python-Selenium/downloads")
    options.set_preference("browser.download.useDownloadDir", True)

    geckodriver_path = '/snap/bin/geckodriver'
    service = FirefoxService(geckodriver_path)

    driver = webdriver.Firefox(options=options, service=service)
    driver.get("https://www.sire.gov.co/web/sab/pronostico-para-bogota")
    driver.implicitly_wait(5)

    yield driver

    driver.quit()


@pytest.fixture(scope="function")
def download_dir():
    return "/home/ramsus/Programing/Platzi/Python-Selenium/downloads"


@pytest.fixture(scope="function")
def pdf_file_path(download_dir):
    today_date = datetime.date.today().strftime("%Y-%m-%d")
    return os.path.join(download_dir,
                        f"pronostico_clima_bogota_{today_date}.pdf")


def test_get_pdf(firefox_driver, download_dir):
    if not pdf_already_downloaded(download_dir):
        g_drive = firefox_driver.find_element(By.ID, "Iframe-google")
        # get link from child iframe source
        g_drive_link = g_drive.find_element(By.TAG_NAME,
                                            "iframe").get_attribute("src")
        # Change end of the link from preview to view
        g_drive_link = g_drive_link.replace("preview", "view")
        # open new tab
        firefox_driver.execute_script("window.open('');")
        firefox_driver.switch_to.window(firefox_driver.window_handles[1])
        firefox_driver.get(g_drive_link)
        download_button = firefox_driver.find_element(
            By.XPATH, "//div[@role='button' and @aria-label='Descargar']")
        # Click download button and wait until file is downloaded
        download_button.click()
        time.sleep(5)
    else:
        print("PDF already downloaded")


def test_rename_pdf(pdf_file_path, download_dir):
    # Get last downloaded file
    list_of_files = os.listdir(download_dir)
    latest_file = max(list_of_files,
                      key=lambda x: os.path.getctime(f"{download_dir}/{x}"))

    # Rename PDF
    new_file_path = pdf_file_path
    old_file_path = os.path.join(download_dir, latest_file)
    os.rename(old_file_path, new_file_path)
    time.sleep(2)


def test_delete_old_files(download_dir):
    # Get all files in downloads folder
    now = datetime.datetime.now()
    # Iterate over files
    for file in os.listdir(download_dir):
        # Get file creation date
        creation_date = datetime.datetime.fromtimestamp(
            os.path.getctime(os.path.join(download_dir, file)))
        # Get difference between current date and file creation date
        delta = now - creation_date
        # If difference is greater than 1 day
        if delta.days > 2:
            # Delete file
            os.remove(os.path.join(download_dir, file))
    time.sleep(2)


def pdf_already_downloaded(download_dir):
    today_date = datetime.date.today().strftime("%Y-%m-%d")
    filename = f"pronostico_clima_bogota_{today_date}.pdf"
    return filename in os.listdir(download_dir)


# pytest ./python_selenium/bot_clima_bogota.py --html=reports/bot_clima.html --verbosity=2
