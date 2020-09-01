FROM registry.redhat.io/ubi8/ubi
RUN INSTALL_PKGS="nss_wrapper bind-utils gettext hostname nginx nginx-mod-stream nginx-mod-http-perl" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS
WORKDIR /usr/src/app
COPY . .
RUN chmod +x /usr/src/app/entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]