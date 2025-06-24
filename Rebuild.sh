docker-compose down -v --remove-orphans
docker image prune -a -f
docker volume prune -f
docker-compose build --no-cache
make up
