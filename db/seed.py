#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys, os
import csv
import sqlite3, re

fh = open(sys.argv[1])

reader = csv.reader(fh)

headers = next(reader)
name_col = headers.index("Name")
desc_col = headers.index("Description")

con = None
command = None

try:
    con = sqlite3.connect('qmiss.db')

    cur = con.cursor()

    for line in reader :
#due to sql for some reason in this wall of text not dealing
#with quotes i am striping them all out at this point
#the fixes i have tried are: escaping and various diffrent
#wraping with quotes
        title = re.sub("[\']","",line[name_col])
        title = re.sub("[\"]","",title)

        description = re.sub("[\']","",line[desc_col])
        description = re.sub("[\"]","",description)

        command = "INSERT INTO NOTES (title,description) values (\""\
        + title + "\",\"" + description + "\");"
        cur.execute(command);

#        print("name: " + title)
#        print("desc: " + description)

except Exception:
    print command

finally:
    if con:
        con.commit()
        con.close();
