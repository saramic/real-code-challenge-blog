FROM ruby:2.6.4

LABEL maintainer="saramic@gmail.com"

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

ENV BUNDLE_PATH /gems

RUN gem install bundler:2.0.2
RUN bundle install

COPY . /usr/src/app/

CMD ["bundle", "exec", "cucumber", "features"]

