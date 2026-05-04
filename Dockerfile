FROM jekyll/jekyll:latest

WORKDIR /srv/jekyll

COPY Gemfile .
COPY Gemfile.lock* .

RUN bundle install

COPY . .

RUN jekyll build

FROM nginx:alpine
COPY --from=0 /srv/jekyll/_site /usr/share/nginx/html

EXPOSE 80
