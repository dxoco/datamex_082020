import os
import re
import urllib
import numpy as np
import pandas as pd
import requests as req
from selenium import webdriver
from bs4 import BeautifulSoup as bs
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


def nasdaq_downloads(navegador, link):

    # define " wait " to be used later along with ExpectedConditions
    wait = WebDriverWait(navegador,15)
    
    # maximize window, then open the provided link
    navegador.maximize_window()
    navegador.get(link)
    
    # check if there is a cookie notice and wait for it to be clickable
    try:
        navegador.switch_to.window(navegador.current_window_handle)
        wait.until(EC.element_to_be_clickable((By.XPATH,'//*[@id="_evidon-decline-button"]')))
        nasdaq_cookie = navegador.find_element_by_xpath('//*[@id="_evidon-decline-button"]')
        nasdaq_cookie.click()
    except:
        pass

    try:
        navegador.switch_to.window(navegador.current_window_handle)
        # find element by XPath on nasdaq website and wait for it to be clickable
        wait.until(EC.element_to_be_clickable((By.XPATH,'/html/body/div[4]/div/main/div[2]/div[4]/div/section/div/div[3]/ul/li[2]/a/span')))
        h_quotes = navegador.find_element_by_xpath('/html/body/div[4]/div/main/div[2]/div[4]/div/section/div/div[3]/ul/li[2]/a/span')
        # go to __Historical Quotes__ within website
        h_quotes.click()

        # locate YTD button to obtain data within scope of this project and wait for it to be clickable
        wait.until(EC.element_to_be_clickable((By.XPATH,'/html/body/div[4]/div/main/div[2]/div[4]/div[3]/div/div[1]/div/div[1]/div[3]/div/div/div/button[3]')))
        ytd_history = navegador.find_element_by_xpath('/html/body/div[4]/div/main/div[2]/div[4]/div[3]/div/div[1]/div/div[1]/div[3]/div/div/div/button[3]')
        # load __YTD__ data
        ytd_history.click()

        # locate ytd data download button and wait for it to be clickable
        wait.until(EC.element_to_be_clickable((By.XPATH,'/html/body/div[4]/div/main/div[2]/div[4]/div[3]/div/div[1]/div/div[1]/div[3]/a')))
        ytd_download = navegador.find_element_by_xpath('/html/body/div[4]/div/main/div[2]/div[4]/div[3]/div/div[1]/div/div[1]/div[3]/a')
        # default save data to download folder
        ytd_download.click()
    except:
        print(f'error at link;\n{link}')
        pass



#   crazy alternative that was to select and copy the full table to the clipboard
#
#   actions = ActionChains(navegador)
#   wait.until(EC.element_to_be_clickable((By.XPATH,'//*[@id="content-9d1f8b01-08a6-4db5-99fa-c40f5873615a"]/div/div[1]/div/div[2]/div[1]/div[4]/div[3]')))
#   navegador.execute_script("window.scrollTo(0,1200)")
#   drag_from = navegador.find_element_by_xpath('//*[@id="content-9d1f8b01-08a6-4db5-99fa-c40f5873615a"]/div/div[1]/div/div[2]/div[1]/div[4]/div[1]/div/div/div/span')
#   drag_to = navegador.find_element_by_xpath('//*[@id="content-9d1f8b01-08a6-4db5-99fa-c40f5873615a"]/div/div[1]/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/div/div/div/span')
#   copy = ActionChains(navegador).click_and_hold(drag_from).move_to_element(drag_to).key_down(Keys.CONTROL).send_keys('c').perform()
#




# source to solve the explicit wait issue:
# https://www.youtube.com/watch?v=JfoTK3QBWYs
# source to solve the CTRL+C in selenium:
# https://stackoverflow.com/questions/37763110/python-selenium-send-keys-control-c-not-copying-actual-text
# source for the NYSE table:
# https://stackoverflow.com/questions/59744982/how-to-store-copied-text-into-a-variable-in-python-using-selenium-webdriver
# if you don't bring selenium to the front, somehow it doesn't load properly. Fix:
# https://stackoverflow.com/questions/23200168/how-to-bring-selenium-browser-to-the-front
