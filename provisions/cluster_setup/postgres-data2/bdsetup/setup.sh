#!/bin/bash

# Build the catalog database

cd /bdsetup
psql -U postgres -c "CREATE DATABASE welllogs2;"
psql -f well_schema_ddl.sql -d welllogs2

psql -U postgres -d welllogs2 -c "\copy welldata.welllogsdata FROM '/bdsetup/data/welllogsdata.csv' DELIMITER ',' CSV HEADER;"


