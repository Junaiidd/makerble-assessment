FROM ruby:3.1.2


RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn


WORKDIR /app


COPY Gemfile* ./
RUN bundle install


COPY . .


RUN bundle exec rake assets:precompile


EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]

