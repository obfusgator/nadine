############################################################
# Dockerfile to run a Django-based web application
# Based on an Ubuntu Image
############################################################

# Set the base image to use to python 2.7
FROM python:2.7

# Set the file maintainer (your name - the file's author)
MAINTAINER Jacob Sayles

# Don't buffer stdout and stderr
ENV PYTHONUNBUFFERED 1

# Set env variables used in this Dockerfile (add a unique prefix, such as DOCKYARD)
# Local directory with project source
ENV DOCKYARD_SRC=./
# Directory in container for all project files
ENV DOCKYARD_SRVHOME=/webapp
# Directory in container for project source files
ENV DOCKYARD_SRVPROJ=/webapp/nadine

# Update the default application repository sources list
RUN apt-get update && apt-get -y upgrade
RUN apt-get autoremove -y
RUN apt-get install -y python-pip libjpeg-dev
RUN pip install --upgrade pip

# Create application subdirectories
WORKDIR $DOCKYARD_SRVHOME
RUN mkdir media static logs
VOLUME ["$DOCKYARD_SRVHOME/media/", "$DOCKYARD_SRVHOME/logs/"]

# Copy application source code to SRCDIR
COPY $DOCKYARD_SRC $DOCKYARD_SRVPROJ

# Install Python dependencies
RUN pip install -r $DOCKYARD_SRVPROJ/requirements.txt

# Port to expose
EXPOSE 8000

# Copy entrypoint script into the image
WORKDIR $DOCKYARD_SRVPROJ
ENTRYPOINT ["./docker-entrypoint.sh"]