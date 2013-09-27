--
-- Written by <<Elliott Lester>>
--
-- Email: Lester.Elliott@gmail.com
--
-- Conventions:
-- * all entity table names are plural
-- * most entities have an artifical primary key called "id"
-- * foreign keys are named after the relationship they represent

-- Tables

-- To create a blank database
-- sqlite3 -init ./qmiss.sql ./qmiss.db

create table Notes (
    id                  integer            PRIMARY KEY AUTOINCREMENT,
    title               varchar(100)       NOT NULL,
    description         text
);

create table Tags (
    id                  integer             PRIMARY KEY AUTOINCREMENT,
    note_id             integer             NOT NULL,
    tag                 varchar(50)         NOT NULL,
    FOREIGN KEY (note_id) REFERENCES Notes(id)
);

create table Attributes (
    id                  integer              PRIMARY KEY AUTOINCREMENT,
    note_id             integer             NOT NULL,
    key                 varchar(50)         NOT NULL,
    value               text,
    FOREIGN KEY (note_id) REFERENCES Notes(id)
);

