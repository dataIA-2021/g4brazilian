

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jan  4 11:50:49 2022

@author: alexiadeboynes
"""
# import des librairies
import sqlite3
#import mysql.connector
import pymysql
import psycopg2
from sqlalchemy import create_engine
import os

import yaml
import pandas as pd

with open ('/Users/alexiadeboynes/Documents/data/Config/config.yml', 'r') as f:
    conf = yaml.safe_load(f)
my = conf['MYSQL']
#conf['MYSQL']['user']


str = f"mysql+pymysql://{my['user']}:{my['password']}@{my['host']}:{my['port']}/{my['database']}"
engine = create_engine(str, echo=False)
str

#ecriture du df ds la bdd
path = '/Users/alexiadeboynes/Documents/data/g4brazilian/'