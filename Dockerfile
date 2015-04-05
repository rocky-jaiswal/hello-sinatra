FROM phusion/passenger-ruby22:0.9.15

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Copy code
ADD . /home/app/hello-sinatra
RUN chown -R app:app /home/app/
RUN gem install bundler

# Setup app
USER app
WORKDIR /home/app/hello-sinatra
RUN bundle install --binstubs --deployment --without test development

USER root
RUN mkdir /etc/service/thin
ADD thin.sh /etc/service/thin/run

EXPOSE 3000

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
