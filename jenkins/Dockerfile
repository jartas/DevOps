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

# Install Ruby
RUN cd /tmp && \
  curl -O http://cache.ruby-lang.org/pub/ruby/3.2/ruby-$RUBY_VERSION.tar.gz && \
  tar -xzf ruby-$RUBY_VERSION.tar.gz && \
  cd ruby-$RUBY_VERSION && \
  ./configure --disable-install-rdoc && \
  make && \
  make install

# Install Rails
RUN gem install rails 
# Install Bundler
RUN gem install bundler

#Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&  \
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" && \
	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install RubyGems
RUN gem update --system

# Install Kaniko executor
COPY --from=gcr.io/kaniko-project/executor:v1.0.0 /kaniko/executor /usr/local/bin/kaniko

# Cleaning
RUN rm -rf /tmp/*

USER jenkins