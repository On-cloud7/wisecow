# Start with Ubuntu for easier package support
FROM ubuntu:20.04

# Avoid prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install fortune-mod and cowsay
RUN apt-get update && \
    apt-get install -y fortune cowsay netcat && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the wisecow script
COPY wisecow.sh /app/wisecow.sh

# Make it executable
RUN chmod +x /app/wisecow.sh

# Expose default port
EXPOSE 4499

# Run script on container start
CMD ["/app/wisecow.sh"]
