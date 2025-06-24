# Use the official Golang base image with Alpine (lightweight)
FROM golang:1.20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy Go module files first (for better caching)
COPY go.mod ./

# Download dependencies
RUN go mod download

# Copy the rest of the code
COPY . .

# Build the Go binary (named 'main' here)
RUN go build -o main .

# Expose the port your app listens on (must match code, e.g., 8001)
EXPOSE 8001

# Command to run the Go application
CMD ["./main"]
