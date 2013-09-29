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

command = "INSERT INTO Notes (title, description) VALUES (:name, :description);"

with sqlite3.connect('qmiss.db') as con :
    cur = con.cursor()

    for line in reader :
        params = {
            "name" :        line[name_col],
            "description" : line[desc_col]
        }
        cur.execute(command, params)

    con.commit()
