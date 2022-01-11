#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jan  7 18:14:22 2022

@author: alexiadeboynes
"""

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

customers = pd.read_csv('olist_customers_dataset.csv', sep= ',', decimal= '.', )
print(customers)

customers.to_sql('customers', con=engine, if_exists='append', index=False)
'''
orderItems = pd.read_csv('olist_customers_dataset.csv', index_col='customer_id', sep= ',', decimal= '.', )
print(customers)

orderItems.to_sql('orderItems', con=engine, if_exists='replace', index=False)'''