FROM sgrio/java-oracle:jdk_8 as builder
MAINTAINER Jian Li <gunine@sk.com>

# Set the environment variables
ENV HOME /root
ENV BUILD_NUMBER docker
ENV JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8
ENV BAZEL_VERSION 0.15.2

RUN update-alternatives --install "/usr/bin/jar" "javac" "${JAVA_HOME}/bin/jar" 1 && \
    update-alternatives --set jar "${JAVA_HOME}/bin/jar"

RUN apt-get update && apt-get install -y zip python git bzip2 build-essential && \
        curl -L -o bazel.sh https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh && \
        chmod +x bazel.sh && \
        ./bazel.sh --user
