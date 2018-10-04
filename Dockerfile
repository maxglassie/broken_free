FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /broken_free
WORKDIR /broken_free
COPY Gemfile /broken_free/Gemfile
COPY Gemfile.lock /broken_free/Gemfile.lock
RUN bundle install
COPY . /broken_free/
