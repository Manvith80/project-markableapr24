FROM ruby:3.1.2
RUN gem update --system
RUN gem install bundler -v 2.3.0

WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dep

RUN bundle install

# Copy the Rails application into the container
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]


