# TO_BUILD:       docker build --rm -t qsdregistry .
# TO_RUN:         docker run --name qsdregistry -p 5000:5000 -v <location>:/registry qsdregistry

FROM        registry:0.7.3

ADD         /public.pem /opt/docker/public.pem
ADD         /qsd-config.yml /opt/docker/qsd-config.yml
ADD         /public.pem /opt/docker/public.pem

ENV         SETTINGS_FLAVOR local
ENV         DOCKER_REGISTRY_CONFIG /opt/docker/qsd-config.yml

VOLUME      ["/registry"]
EXPOSE      5000

CMD         ["docker-registry"]
