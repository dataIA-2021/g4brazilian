# import des librairies
import sqlite3
#import mysql.connector

from sqlalchemy import create_engine # librairie pour creer connexion
import pymysql # librairie pour importe sur mysql
import yaml # librairie pour lire les fichier yam ou mettre les donnees de la BDD
import pandas as pd
# https://docs.sqlalchemy.org/en/14/core/engines.html


with open ('config.yaml', 'r') as f:
    conf = yaml.safe_load(f)

my = conf['MYSQL']

#print(conf)

# Connection MYSQL
str = f"mysql+pymysql://{my['user']}:{my['password']}@{my['host']}:{my['port']}/{my['database']}"
engine = create_engine(str, echo=False)

print(str)
import os

#path = os.getcwd() # Chemin relatif

def deleteExt(name):
    return name[:-4]


def exportBdd(name):
    df = pd.read_csv(name, sep= ',', decimal= '.')
    table_name = deleteExt(name)
    df.to_sql(table_name, con=engine, if_exists='append', index=False)
    print(table_name)


#dirPath = os.getcwd() # Chemin relatif     
#name = [f for f in os.listdir(dirPath) if f.endswith('.csv')]

#for i in name: 
   # exportBdd(i)



#Export manuellement:    
df = pd.read_csv('product_category_name_translation.csv', sep= ',', decimal= '.')   
df.to_sql('product_category_name_translation.csv', con=engine, if_exists='append', index=False)    




    


    