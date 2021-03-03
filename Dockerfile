FROM python:3.7.2-alpine

LABEL maintainer="William Kokolis <william@kokolis.net>"

RUN addgroup pyrunner \
  && adduser -S -G pyrunner pyrunner \
  && apk add --no-cache curl libpq \
  && mkdir /app \
  && chown pyrunner.pyrunner /app

WORKDIR /app

COPY . /app

RUN chown -R pyrunner.pyrunner /app

USER pyrunner

CMD ["python", "hello.py"]
