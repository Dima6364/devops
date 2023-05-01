FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl \
    ssmtp

COPY bash.sh /usr/local/bin/bash.sh
RUN chmod +x /usr/local/bin/bash.sh
CMD ["cron", "-f"]
