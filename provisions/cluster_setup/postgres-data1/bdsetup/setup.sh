#!/bin/bash

# Build the catalog database

cd /bdsetup
psql -U postgres -c "CREATE DATABASE welllogs1;"
psql -f well_schema_ddl.sql -d welllogs1
psql -U postgres -d welllogs1 -c "\copy welldata.productiondata FROM '/bdsetup/data/productiondata.csv' DELIMITER ',' CSV HEADER;"
#psql -U postgres -d welllogs1 -c "\copy welldata.welllogsdata FROM '/bdsetup/data/welllogsdata.csv' DELIMITER ',' CSV HEADER;"



