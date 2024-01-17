FROM jenkins/jnlp-agent-jdk11
USER root

ARG DEBIAN_FRONTEND=noninteractive

# Set environment variables
ENV RUBY_VERSION 3.2.2
ENV RAILS_VERSION 7.0.6

RUN apt-get update && apt-get install -y \
  git-core curl \
  zlib1g-dev \
  build-essential \
  postgresql-client \
  autoconf \
  libyaml-dev \
  libpq-dev \
  libssl-dev && \
  rm -rf /var/lib/apt/lists/*

# Installing docker
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install Ruby
RUN cd /tmp && \
  curl -O http://cache.ruby-lang.org/pub/ruby/3.2/ruby-$RUBY_VERSION.tar.gz && \
  tar -xzf ruby-$RUBY_VERSION.tar.gz && \
  cd ruby-$RUBY_VERSION && \
  ./configure --disable-install-rdoc && \
  make && \
  make install

# Install Rails
RUN gem install rails #-v $RAILS_VERSION
# Install Bundler
RUN gem install bundler

# Install RubyGems
RUN gem update --system

# Cleaning
RUN rm -rf /tmp/*

USER jenkins
