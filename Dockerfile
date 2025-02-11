FROM jetbrains/teamcity-server:latest

# Switch to root user
USER root

# Install Docker
RUN apt-get update && apt-get install -y \
    docker.io \
    systemd \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Set up Docker socket for the container to communicate with the Docker daemon on the host
VOLUME /var/run/docker.sock:/var/run/docker.sock

# Enable systemd in the container
RUN systemctl enable docker.service

# Switch back to tcuser
USER tcuser

# Expose ports for TeamCity Server
EXPOSE 8111
