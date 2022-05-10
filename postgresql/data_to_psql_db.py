'''
---------------------------------------------------------------------
Reading & Querying Data sets using dataframes
Revised JAN '21
Sami El-Mahgary /Aalto University
Copyright (c) <2021> <Sami El-Mahgary>
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
--------------------------------------------------------------------
ADDITIONAL source for PostgreSQL
-----------------
1. psycopg2 documentation: 
    https://www.psycopg.org/docs/index.html
2. comparing different methods of loading bulk data to postgreSQL:
    https://medium.com/analytics-vidhya/pandas-dataframe-to-postgresql-using-python-part-2-3ddb41f473bd

''' 
import psycopg2
from psycopg2 import Error
from sqlalchemy import create_engine, text
import pandas as pd
import numpy as np


def run_sql_from_file(sql_file, psql_conn):
    '''
	read a SQL file with multiple stmts and process it
	adapted from an idea by JF Santos
	Note: not really needed when using dataframes.
    '''
    sql_command = ''
    for line in sql_file:
        #if line.startswith('VALUES'):        
     # Ignore commented lines
        if not line.startswith('--') and line.strip('\n'):        
        # Append line to the command string, prefix with space
           sql_command +=  ' ' + line.strip('\n')
           #sql_command = ' ' + sql_command + line.strip('\n')
        # If the command string ends with ';', it is a full statement
        if sql_command.endswith(';'):
            # Try to execute statement and commit it
            try:
                #print("running " + sql_command+".") 
                psql_conn.execute(text(sql_command))
                #psql_conn.commit()
            # Assert in case of error
            except:
                print('Error at command:'+sql_command + ".")
                ret_ =  False
            # Finally, clear command string
            finally:
                sql_command = ''           
                ret_ = True
    return ret_

def main():
    DATADIR = '//Users//sophietruong//Desktop//Database2022_TA_materials//tutorial_4//'
    # use connect function to establish the connection
    try:
        # Connect the postgres database from your local machine 
        connection = psycopg2.connect(
        database="postgres",    # TO BE REPLACED 
        user='postgres',        # TO BE REPLACED
        password='password',
        host='localhost'
        )
        connection.autocommit = True

        # Create a cursor to perform database operations
        cursor = connection.cursor()
        # Print PostgreSQL details
        print("PostgreSQL server information")
        print(connection.get_dsn_parameters(), "\n")
        # Executing a SQL query
        cursor.execute("SELECT version();")
        # Fetch result
        record = cursor.fetchone()
        print("You are connected to - ", record, "\n")
        # -------------- Start Example -----------------#
        # Step 0: Creating a database 
        #       (here I used a work around for CREATE DATABASE if not exists:
        #         https://stackoverflow.com/questions/18389124/simulate-create-database-if-not-exists-for-postgresql)
        sql = '''   SELECT 'CREATE DATABASE tutorial4'
                    WHERE NOT EXISTS 
                    (SELECT FROM pg_database WHERE datname = 'tutorial4');''' # can check on shell
        cursor.execute(sql)
        print("Database created successfully........")
        # cursor.close()
        #####################################################################################################
        # Create and fill table from sql file using run_sql_from_file function (Not needed if using pandas df)
        #####################################################################################################
        print("Creating DB...")

        engine = create_engine('postgresql+psycopg2://postgres:password@localhost/tutorial4')
        sql_file1  = open(DATADIR + '/postgresql/create_and_file_db_psql.sql')
        psql_conn  = engine.connect()
        # run statements to create tables
        run_sql_from_file (sql_file1, psql_conn)
        # test
        result = psql_conn.execute('SELECT * FROM student LIMIT 10')
        print(f'After create and insert:\n{result.fetchall()}')
        # Drop table
        psql_conn.execute('DROP TABLE "student"')
        

        print ("\n\nUsing pandas dataframe to read sql queries and fill table")
        #####################################################################################################
        # Create and file table from sql file using run_sql_from_file function (Not needed if using pandas df)
        #####################################################################################################
        # Step 0: create table using sqlite_conn
        cursor.execute("""CREATE TABLE IF NOT EXISTS Student(
                        studid INT NOT NULL,
                        name VARCHAR(100) NOT NULL,
                        DOB DATE NOT NULL,
                        program VARCHAR(10) NOT NULL,
                        credit INT NOT NULL,
                        PRIMARY KEY (id)
                        );""")
  
        # Step 1: read csv
        df = pd.read_csv(DATADIR + 'student_data.csv', sep=',', quotechar='"',dtype='unicode')

        #if we have an excel file
        #df = pd.read_excel('ourfile.xlsx')
        
        # Some pre-processing
        df = df.loc[:,'studid':'credit'] 
        print(df)
        # Step 2: the dataframe df is written into an SQL table 'student'
        df.to_sql('student', con=engine, if_exists='append', index=False)
    
        #test
        sql_ =  """
                SELECT * FROM student LIMIT 10
                """
        test_df = pd.read_sql_query(sql_,psql_conn)
        print("Select 10 students from Student table: ")
        print(test_df)


    except (Exception, Error) as error:
        print("Error while connecting to PostgreSQL", error)
    finally:
        if (connection):
            psql_conn.close()
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")
main()