import json
import requests
import pandas as pd
from pandas.io.json import json_normalize

listin = []
def xkcd(n):
    x = True
    while x == True:
        try:
            response = requests.get(f'http://xkcd.com/{n}/info.0.json').json()
            listin.append(response)
        except:
            x = False
    return listin
