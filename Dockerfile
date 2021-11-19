FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /qc_search
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME
RUN bundle install

EXPOSE 4567
