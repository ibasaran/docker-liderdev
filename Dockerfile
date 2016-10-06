FROM debian:jessie
MAINTAINER ismail BAŞARAN <basaran.ismaill@gmail.com>

RUN set -x;
	
RUN	set -x; \
	apt-get update \
	&& apt-get install -y --no-install-recommends \
	git \
	wget \
	ssh \
	sudo
RUN apt-get update && apt-get install -y libgtk2.0-0 libcanberra-gtk-module

RUN set -x; \
	wget http://transfer.pardus.org.tr/ismail.basaran/ftp/diger/oracle-java8-jdk_8u91_amd64.deb -O /tmp/oracle.deb -q \
	&& ls /tmp \
	&& dpkg --force-depends -i /tmp/oracle.deb \ 
	&& apt-get -y install -f --no-install-recommends 

RUN set -x; \
	wget http://ftp.itu.edu.tr/Mirror/Apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -O /tmp/maven.tar.gz -q \
	&& ls /tmp \
	&& tar -xf /tmp/maven.tar.gz -C /opt

RUN set -x; \
	wget http://transfer.pardus.org.tr/tuncay.colak/ftp/eclipse.tar.gz -O /tmp/eclipse.tar.gz -q && \
    echo 'Installing eclipse' && \
    tar -xf /tmp/eclipse.tar.gz -C /opt && \
    rm /tmp/eclipse.tar.gz

ENV MVN_HOME /opt/apache-maven-3.3.9

ENV JAVA_HOME /usr/lib/jvm/jdk-8-oracle-x64

ENV PATH	/opt/apache-maven-3.3.9/bin:$PATH

ENV DEVENV	/home/developer

RUN ln -s /opt/apache-maven-3.3.9/bin/mvn /usr/local/bin/mvn

RUN mvn -version

RUN java -version

ADD updategit /usr/local/bin/updategit

RUN chmod +x /usr/local/bin/updategit

RUN mkdir -p /home/developer && \
	echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
	echo "developer:x:1000:" >> /etc/group && \
	echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
	chmod 0440 /etc/sudoers.d/developer && \
	chown developer:developer -R /home/developer && \
	chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

USER developer

WORKDIR /home/developer

CMD bash -C 'updategit';'bash'









