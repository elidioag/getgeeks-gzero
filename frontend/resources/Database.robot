*Settings*
Documentation       Database Helpers

Library     DatabaseLibrary
Library     factories/Users.py

*Keywords*
Connect To Postgres
    Connect To Database     psycopg2
    ...                     kebrnzkm
    ...                     kebrnzkm
    ...                     7VaH6Xln5lhe1GcoR85-PG20KT_mE0-v
    ...                     salt.db.elephantsql.com
    ...                     5432

Reset Env
    Execute SQL String      DELETE FROM PUBLIC.GEEKS;
    Execute SQL String      DELETE FROM PUBLIC.USERS;

Insert User
    [Arguments]     ${u}

    ${hashed_pass}      Get Hashed Pass     ${u}[password]

    ${q}        Set Variable        INSERT INTO PUBLIC.USERS (NAME, EMAIL, PASSWORD_HASH, IS_GEEK) VALUES ('${u}[name] ${u}[lastname]', '${u}[email]', '${hashed_pass}', false)

    Execute SQL String      ${q}

Users Seed

    ${users}        Users To Insert DB

    FOR     ${user}     IN      @{users}
        Insert User     ${user}
    END