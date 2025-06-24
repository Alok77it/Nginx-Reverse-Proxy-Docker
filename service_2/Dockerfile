# Use a lightweight Python base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy dependency file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all app files into the container
COPY . .

# Expose the port the Python app runs on (e.g., 8002)
EXPOSE 8002

# Command to run the Python app (edit if it's FastAPI/Flask)
CMD ["python", "app.py"]
