FROM ruby:2.6.3-slim

RUN apt-get update -qq \
	&& apt-get install -y --no-install-recommends \
    build-essential \
    gnupg2 \
    nodejs \
    wget

RUN gem install bundler

RUN mkdir /mnt/rails
COPY Gemfile /mnt/rails/
COPY Gemfile.lock /mnt/rails/
WORKDIR /mnt/rails

# Bundle install
RUN bundle install
COPY . /mnt/rails

EXPOSE 5000


