FROM jekyll/jekyll:4.2.2 AS builder

WORKDIR /srv/jekyll

COPY Gemfile .
COPY Gemfile.lock* .

RUN bundle install

COPY . .

RUN jekyll build

FROM nginx:alpine
COPY --from=builder /srv/jekyll/_site /usr/share/nginx/html

EXPOSE 80