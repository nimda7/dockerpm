FROM centos:7
LABEL maintainer="nimda7@gmail.com"

ENV FLAVOR=rpmbuild OS=centos DIST=el7

RUN yum install -y gcc gcc-c++ \
                   libtool libtool-ltdl \
                   make cmake \
                   git \
                   pkgconfig \
                   sudo \
                   automake autoconf \
                   yum-utils rpm-build \
                   rpmdevtools rpmlint && \
    yum clean all && \
#    rm -rf /var/cache/yum && \
    rpmdev-setuptree

#RUN echo "# macros"                      >  /root/rpmbuild/.rpmmacros && \
#    echo "%_topdir    /home/builder/rpm" >> /root/rpmbuild/.rpmmacros && \
#    echo "%_sourcedir %{_topdir}"        >> /root/rpmbuild/.rpmmacros && \
#    echo "%_builddir  %{_topdir}"        >> /root/rpmbuild/.rpmmacros && \
#    echo "%_specdir   %{_topdir}"        >> /root/rpmbuild/.rpmmacros && \
#    echo "%_rpmdir    %{_topdir}"        >> /root/rpmbuild/.rpmmacros && \
#    echo "%_srcrpmdir %{_topdir}"        >> /root/rpmbuild/.rpmmacros

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]