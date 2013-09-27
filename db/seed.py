#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys, os
import csv

fh = open(sys.argv[1])

reader = csv.reader(fh)

headers = next(reader)
name_col = headers.index("Name")
desc_col = headers.index("Description")

for line in reader :
    print("name: " + line[name_col])
    print("desc: " + line[desc_col])
