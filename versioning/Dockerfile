
FROM bitwalker/alpine-elixir-phoenix:latest as develop

WORKDIR /app

# RUN mix archive install hex
RUN mix archive.install hex phx_new 1.5.12 --force

FROM develop as build 

# COPY mix.exs .
# COPY mix.lock .

# RUN mkdir assets

# COPY assets/package.json assets
# COPY assets/package-lock.json assets

CMD mix deps.get && cd assets && npm install && cd .. && mix phx.server
# CMD ["/app/entrypoint.sh"]