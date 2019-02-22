FROM ruby:2.5-alpine3.9
WORKDIR /tmp

RUN apk add --no-cache openssh git build-base gcc nodejs-current tzdata

COPY Gemfile* ./

RUN gem install bundler -v 2.0.1
RUN bundle config --global frozen 1 \
&& bundle install -j4 --retry 3 --without development test 
COPY . .

RUN bundle exec rake assets:precompile RAILS_ENV=production
