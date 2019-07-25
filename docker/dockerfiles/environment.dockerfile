FROM ubuntu:16.04

# ------------------------------------------------------
# --- usual apt-get steps & install linux packages
RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    openssh-client \
    apache2 \
    unzip \
    gnupg \
    curl \
    nano \
    php \
    ssh \
    git

# ------------------------------------------------------
# --- usual apt-get steps & install linux packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    libapache2-mod-php \
    php-memcached \
    php-readline \
    php-mbstring \
    php-sqlite3 \
    php-xmlrpc \
    php-bcmath \
    php-pgsql \
    php-mysql \
    php-curl \
    php-json \
    php-soap \
    php-intl \
    php-dev \
    php-xml \
    php-zip \
    php-cli \
    php-gd

# ------------------------------------------------------
# --- Cleanup and rev num
RUN apt-get update && apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
