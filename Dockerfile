########## How To Use Docker Image ###############
##
##  Image Name: denny/docker-healthcheck-notify-slack:latest
##  Git link: https://github.com/DennyZhang/docker-healthcheck-notify-slack/blob/master/Dockerfile
##  Docker hub link:
##  Build docker image: docker build --no-cache -t denny/docker-healthcheck-notify-slack:latest --rm=true .
##  How to use:
##      https://github.com/DennyZhang/docker-healthcheck-notify-slack/blob/master/README.md
##
##  Description: Send slack alerts, if any containers run into unhealthy
##
##  Read more: https://www.dennyzhang.com/docker_monitor
##################################################
# Base Docker image: https://hub.docker.com/_/python/

FROM python:3.6.2-jessie

env SLACK_CHANNEL ""
env SLACK_USERNAME ""
env SLACK_TOKEN ""
env MSG_PREFIX ""
env CHECK_INTERVAL_MINS "300" # seconds

LABEL maintainer "Denny<denny@dennyzhang.com>"

user root
WORKDIR /
Add monitor-docker-slack.py /monitor-docker-slack.py

RUN chmod o+x /*.py

ENTRYPOINT ["/monitor-docker-slack.py"]
