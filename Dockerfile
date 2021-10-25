FROM elixir:1.12

RUN apt-get update && \
 apt-get install -y inotify-tools -y postgresql-client

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force &&  mix deps.get

RUN mix do compile

CMD ["/app/entrypoint.sh"]