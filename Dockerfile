FROM debian:latest AS build-env

RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
RUN cd /usr/local/flutter && git checkout efbf63d9c66b9f6ec30e9ad4611189aa80003d31

ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor -v

RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter clean
RUN flutter pub get
RUN flutter build web

FROM nginx:1.25.2-alpine

COPY --from=build-env /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]