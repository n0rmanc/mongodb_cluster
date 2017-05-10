FROM rails:4.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get update -qq && apt-get install -y imagemagick
RUN apt-get install -y optipng jpegoptim

RUN mkdir /app
WORKDIR /app


ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle check || bundle install
ADD . /app/

# prepare foldes for puma
RUN mkdir -p shared/pids shared/sockets shared/log

CMD ./script/start