# Use the official Python image.
FROM python:3.11

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY app/requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install ping and curl.
RUN apt-get update && \
  apt-get install -y iputils-ping curl && \
  apt-get clean

# Copy the rest of the application code into the container
COPY app/ .

# Collect static files
RUN python manage.py collectstatic --noinput

# Specify the command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "backend.wsgi"]
