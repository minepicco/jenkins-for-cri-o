From jenkinsci/blueocean:latest
RUN echo -e "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache add podman tzdata fuse-overlayfs && \
    echo -e "[storage]\n  driver = \"overlay\"\n  [storage.options]\n    mount_program = \"/usr/bin/fuse-overlayfs\"" > /etc/containers/storage.conf && \
    echo -e "[registries.search]\nregistries = ['docker.io', 'quay.io']" > /etc/containers/registries.conf && \
    adduser --disabled-password podman && \
    echo "podman:100000:65536" >> /etc/subuid && \
    echo "podman:100000:65536" >> /etc/subgid
EXPOSE 8080
