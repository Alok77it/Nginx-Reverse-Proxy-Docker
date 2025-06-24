# Build all services using docker-compose
build:
	docker-compose build

# Build and start all containers
up:
	docker-compose up --build

# Stop and remove all running containers
down:
	docker-compose down

# Tail logs for all containers
logs:
	docker-compose logs -f

# Check if both services are healthy (based on healthchecks)
health:
	curl -f http://localhost:8080/service1 && echo "Service 1 OK"
	curl -f http://localhost:8080/service2 && echo "Service 2 OK"

# Remove all containers, networks, volumes (CAREFUL)
clean:
	docker-compose down -v --remove-orphans


#command

#make build     # Build all Docker images
#make up        # Start all services
#make logs      # Follow logs in real time
#make health    # Check if both services respond
#make down      # Stop and remove containers
