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
command = "INSERT INTO Notes (title, description) VALUES (:name, :description);"

try:
    con = sqlite3.connect('qmiss.db')

    con.text_factory = str

    cur = con.cursor()

    for line in reader :
        params = {
            "name" :        line[name_col],
            "description" : line[desc_col]
        }
        cur.execute(command, params)

except Exception as e:
    print(e)
    print(command)

finally:
    if con:
        con.commit()
        con.close();
