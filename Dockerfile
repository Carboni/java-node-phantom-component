from onsdigital/java-node-component

# Phantom JS 2 build taken from: https://github.com/rosenhouse/phantomjs2


# Dependencies for running phantomjs

RUN apt-get clean
RUN apt-get update -y
RUN apt-get install -fyqq \
  libicu-dev \
  libfontconfig1-dev \
  libjpeg-dev \
  libfreetype6 \
  openssl


# Add pre-built binaries:

ADD ./ubuntu /built/


# Symlink

RUN echo "Symlink phantom so that we are able to run `phantomjs`"
RUN ln -s /built/ubuntu/bin/phantomjs /usr/local/share/phantomjs
RUN ln -s /built/ubuntu/bin/phantomjs /usr/local/bin/phantomjs
RUN ln -s /built/ubuntu/bin/phantomjs /usr/bin/phantomjs


# Test

RUN echo "Checking if phantom works"
RUN phantomjs -v
CMD echo "phantomjs binary is located at /phantomjs/bin/phantomjs" \
     && echo "just run 'phantomjs' (version `phantomjs -v`)"
