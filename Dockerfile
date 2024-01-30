# Use an official Python runtime as a parent image
FROM python:3.10.12

# Install python3-venv
RUN apt-get update && \
    apt-get install -y python3-venv
# Set the working directory to the name of the application
WORKDIR /~/Desktop/flask

# Copy the requirements file into the container at the application 
COPY requirements.txt /~/Desktop/flask/requirements.txt

# Create a virtual environment in /opt/env
RUN python3 -m venv /opt/env

# Install any needed packages specified in requirements.txt
RUN /opt/env/bin/pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at the application
COPY . /~/Desktop/flask/

# Set environment variables
ENV PATH="/~/Desktop/flask/env/bin:$PATH"

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run flask application when the container launches
CMD ["/opt/env/bin/python", "-m","flask", "run","--host=0.0.0.0"]
