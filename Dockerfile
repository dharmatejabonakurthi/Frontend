FROM nginx
WORKDIR /usr/share/nginx/html/
COPY . .

RUN echo "my first nginx code"


