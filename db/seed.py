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
    con.text_factory = str
    cur = con.cursor()

    for line in reader :
        title = line[name_col]
        description = line[desc_col]

        sql = "INSERT INTO NOTES (title,description) values (?,?)"
        cur.execute(sql ,(title, description));

#        print("name: " + title)
#        print("desc: " + description)

finally:
    if con:
        con.commit()
        con.close();
