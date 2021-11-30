FROM alpine:latest

LABEL "com.github.actions.name"="git_push_action"
LABEL "author"="Jianfeng"

RUN apk --update add git  && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]