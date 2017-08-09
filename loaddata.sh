#!/bin/bash
createdb superior
export PGDATABASE=superior
psql -c "create extension postgis;"
psql -f loadresults.sql
shp2pgsql -s 26915 -D -S -t 2D -I superior100.shp superior100 | psql
shp2pgsql -s 26915 -D -S -t 2D -I aidstations.shp aidstations | psql
raster2pgsql -I -Y -C -s 26915 -t 100x100 sht_dem25m.tif dem | psql