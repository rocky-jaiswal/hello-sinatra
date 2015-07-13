FROM jruby:9.0.0.0.rc2-jdk

# Setup the app user
RUN groupadd -r app && useradd -r -g app app

# Copy code
ADD . /home/app/hello-sinatra
RUN chown -R app:app /usr/local/bundle
RUN chown -R app:app /home/app/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup app
USER app
WORKDIR /home/app/hello-sinatra
RUN bundle install --binstubs --deployment --without test development

EXPOSE 3000

ENTRYPOINT bundle exec jruby app.rb -s Puma -p 3000 -o 0.0.0.0