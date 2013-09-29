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
attributes_command = """INSERT INTO Attributes (note_id, key, value)
                            VALUES (:note_id, :key, :value);"""

with sqlite3.connect('qmiss.db') as con :
    cur = con.cursor()

    cur.execute("PRAGMA foreign_keys = ON;");

    for line in reader :
        params = {
            "name" :        line[name_col],
            "description" : line[desc_col]
        }
        cur.execute(command, params)

        row = cur.lastrowid
        for (index, field) in enumerate(line) :
            if index != name_col or index != desc_col :
                cur.execute(attributes_command, {
                    "note_id"   : row,
                    "key"       : headers[index],
                    "value"     : field
                    })

    con.commit()
