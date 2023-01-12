FROM postgres:latest

ENV TZ="Europe/Brussels" \
    PGTZ="Europe/Brussels"

# Include DB configuration
COPY postgresql-cfg /opt/app-root/src/postgresql-cfg
# Include scripts to execute after db initialization
COPY postgresql-start /opt/app-root/src/postgresql-start
