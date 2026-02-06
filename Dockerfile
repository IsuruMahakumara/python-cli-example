# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the files needed for installation first (for caching)
COPY requirements.txt setup.py ./

# Install dependencies and the package in editable mode (or just use 'pip install .')
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir .

# Copy the rest of the application code
COPY . .

# Set the entrypoint to your CLI tool
ENTRYPOINT ["blkpy"]

# Default command (can be overridden, e.g., 'blkpy --help')
CMD ["--help"]
