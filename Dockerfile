# Pull base image.
FROM ubuntu:13.10

MAINTAINER Florent Benoit

# Set working directory.
ENV HOME /root
WORKDIR /root


# ruby is required for compass / sass
# unzip is required for unzipping application
# software-properties is used for add-apt-repository command
# python-software-properties is used for nodejs
RUN apt-get install -y software-properties-common python-software-properties unzip ruby-full rubygems1.8
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs

# Install sass/compass
RUN gem install sass
RUN gem install compass

# Install Yo stack
RUN npm install -g yo generator-angular

### Steps that can be done by applications :


# Unpack application
#ADD application.zip /tmp/application.zip
#RUN unzip -uo /tmp/application.zip -d /root/application;
#RUN rm /tmp/application.zip

#EXPOSE 9000
# Run application
#WORKDIR /root/application

#CMD grunt serve

