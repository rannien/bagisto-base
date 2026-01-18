FROM nginx:1.29.4

ARG APP_HOST
ARG COMPOSE_PROJECT_NAME

COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s/##app-host##/${APP_HOST}/g" /etc/nginx/conf.d/default.conf && \
    sed -i "s/##compose-project-name##/${COMPOSE_PROJECT_NAME}/g" /etc/nginx/conf.d/default.conf

EXPOSE 80
