FROM alpine:latest

LABEL "com.github.actions.name"="git_push_action"
LABEL "author"="Jianfeng"

RUN apk update && apk add git

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]