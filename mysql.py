import pymysql # MySQL client
from sqlalchemy import create_engine # Interface entre python et la bdd
import pandas as pd
import yaml
import os # fonctionnalites du système d'exploitation

# Ouverture du fichier config pour connection bdd
with open('config.yaml','r') as f:
    conf = yaml.safe_load(f)

my = conf['MYSQL'] # Attention, verifier ici les valeurs

# Connection MYSQL
str = f"mysql+pymysql://{my['user']}:{my['password']}@{my['host']}:{my['port']}/{my['database']}"
engine = create_engine(str, echo=False)

path = os.getcwd() # Recupere le chemin relatif du dossier 

# Lecture et export de l'ensemble des CSV
def readCSVAndExportToDB(csvFileName):
    print(csvFileName) # Info dans la console
    df = pd.read_csv(csvFileName) # Lecture du csv par pandas
    tableName = csvFileName[:-4] # Retire l'extention .CSV
    # Precise l'arg. append pour ajouter des donnees dans des tables deja crees
    df.to_sql(tableName, con=engine, if_exists='append', index=False)

directory = os.fsencode(path) # Encode le chemin du repertoire dans l'encodage du systeme
for file in os.listdir(directory): # Parcours des fichiers dans le reptoire
     filename = os.fsdecode(file) # Decode le fichier dans l'encodage du systeme
     if filename.endswith('.csv'): # Uniquement les fichiers csv
         readCSVAndExportToDB(filename)


