FROM ruby:2.5-alpine3.9 as builder
WORKDIR /usr/src/app

RUN apk add --no-cache openssh git build-base gcc

COPY Gemfile* ./

RUN gem install bundler -v 2.0.1
RUN bundle config --global frozen 1 \
&& bundle install -j4 --retry 3 --without development test \
&& rm -rf /usr/local/bundle/cache/*.gem \
&& find /usr/local/bundle/gems/ -name "*.c" -delete \
&& find /usr/local/bundle/gems/ -name "*.o" -delete

FROM ruby:2.5-alpine3.9
WORKDIR /usr/src/app

COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY . .

ENV LANG C.UTF-8
ENV RAILS_ENV production

RUN apk add --no-cache nodejs-current tzdata

EXPOSE 3000

CMD ["bundle", "exec", "puma"]
