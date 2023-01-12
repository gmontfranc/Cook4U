#!/usr/bin/env bash
#shopt -s nullglob
table_count=$(psql -d $POSTGRESQL_DATABASE -t -c "select count(*) from information_schema.tables where table_schema = 'public';")
if (( ${table_count} > 0 )); then
  echo "Cook4U tables already exist. Not re-creating them."
else
  echo "Cook4U tables don't exist. Executing SQL scripts."
  DATA_DIR="/opt/app-root/src/postgresql-start/data/"
  for file in "$DATA_DIR"/*.sql; do
    psql -d $POSTGRESQL_DATABASE -f "${file}"
  done
fi
