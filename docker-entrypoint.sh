#!/bin/sh
set -e

# Wait for DB if needed (simple loop) — in this repo we use sqlite so it's immediate.
# Run migrations and collectstatic, then start the server.
python manage.py migrate --noinput
python manage.py collectstatic --noinput || true

# Exec the container CMD
exec "$@"
