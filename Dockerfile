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
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y software-properties-common python-software-properties git unzip ruby-full rubygems1.8
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs

# Install sass/compass
RUN gem install sass
RUN gem install compass

# Install Yo stack
RUN npm install -g yo generator-angular

# Add a user
RUN adduser --disabled-password --home=/home/user --gecos "" user


# Run all operations in user mode
USER user
ENV HOME /home/user
WORKDIR /home/user

### Steps that can be done by applications :
# Unpack application
#ADD angularjs.zip /home/user/application.zip
#RUN unzip -uo /home/user/application.zip -d /home/user/application
#RUN rm /home/user/application.zip

#WORKDIR /home/user/application


# Download npm dependencies
#RUN npm install

# Download bower dependencies
#RUN bower install

# Application will listen on 9000 port number
#EXPOSE 9000


#CMD grunt serve
