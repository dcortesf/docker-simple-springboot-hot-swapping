FROM centos:7
MAINTAINER Daniel Cortés (dcortes@stratio.com)

ENV HOME /opt/stratio
ENV ARTIFACT_URL $ARTIFACT_URL

ENV JAVA_VERSION 1.8.0
ENV GID 20000
ENV UID 20000

ENV M2_HOME /opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}

RUN mkdir $HOME

RUN groupadd --gid $GID java && useradd --uid $UID -m -g java java && \
    yum -y install \
       java-$JAVA_VERSION-openjdk-devel \
       procps-ng \
       strace \
       unzip \
       rsync \
       git \
       wget && \
    yum clean all


WORKDIR /opt
RUN wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar xzf apache-maven-3.3.9-bin.tar.gz && \
    rm apache-maven-3.3.9-bin.tar.gz && \
    ln -s apache-maven-3.3.9 maven

COPY application/ /tmp/
ADD scripts $HOME/scripts

RUN git config --global user.name "Java"
RUN git config --global user.email "dcortes@stratio.com"
RUN chown -R java:java $HOME
RUN chown -R java:java $HOME/scripts
RUN chmod 777 $HOME/scripts/start.sh

EXPOSE 8080

USER java

WORKDIR $HOME/scripts
CMD ["/opt/stratio/scripts/start.sh"]
