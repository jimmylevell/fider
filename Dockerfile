###############################################################################################
# levell fider - BASE
###############################################################################################
FROM getfider/fider:0.21.1 as levell-fider-base

USER root

RUN apt-get update
RUN apt-get install dos2unix -y

RUN mkdir -p /docker

###############################################################################################
# levell fider - DEPLOY
###############################################################################################
FROM levell-fider-base as levell-fider-deploy

COPY ./docker/custom_entrypoint.sh /docker/custom_entrypoint.sh
RUN chmod +x /docker/custom_entrypoint.sh
RUN dos2unix /docker/custom_entrypoint.sh

COPY ./docker/set_env_secrets.sh /docker/set_env_secrets.sh
RUN chmod +x /docker/set_env_secrets.sh
RUN dos2unix /docker/set_env_secrets.sh

EXPOSE 3000
ENTRYPOINT [ "/docker/custom_entrypoint.sh" ]
