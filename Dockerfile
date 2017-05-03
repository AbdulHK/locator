FROM python:3.4

MAINTAINER Abdul

# Update OS
RUN apt-get -y update
RUN apt-get -y upgrade

# Install geospatial package
RUN apt-get -y install libgdal-dev

# Create app directory
COPY . /app
WORKDIR /app

# Update pip and install reqs
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose listening port
EXPOSE 8000

# Run server
ENTRYPOINT ["python"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]
