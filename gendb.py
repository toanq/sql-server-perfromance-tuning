import random
import string
import math
import pyodbc
import sys

def mkrd():
  ln = math.trunc(random.random()*20+20)
  rs = ''
  for _ in range(1,ln+1):
    rs += random.choice(string.ascii_letters + string.digits)
  return rs

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=localhost;'
                      'Database=sqltn;'
                      'UID=sa;'
                      'PWD=sa;'
                      'Trusted_Connection=yes;')
cursor = conn.cursor()

start = sys.argv[0]
end = sys.argv[1]
db = sys.argv[2]


#f = open("db2.sql", "w")
for ii in range(start, end+1):
  #f.write("INSERT INTO [dbo].[sample]([guid],[col1],[col2],[col3]) VALUES(DEFAULT, '{col1}', '{col2}', '{col3}')\n".format(col1=mkrd(), col2=mkrd(), col3=mkrd()))
  cursor.execute("INSERT INTO [dbo].[{db}]([guid],[col1],[col2],[col3]) VALUES(DEFAULT, '{col1}', '{col2}', '{col3}')\n".format(db=db, col1=mkrd(), col2=mkrd(), col3=mkrd()))
  conn.commit()
#f.close()