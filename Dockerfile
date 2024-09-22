# Stage 1: Build the Rust application
FROM rust:latest AS builder

# Set the working directory inside the builder container
WORKDIR /usr/src/app

# Copy the source code into the container
COPY . .

# Build the project in release mode
RUN cargo build --release

# Stage 2: Create a lightweight production image
FROM debian:trixie-slim

# Create the directory for the binary in the final image
WORKDIR /usr/src/app

# Copy the compiled binary from the builder stage
COPY --from=builder /usr/src/app/target/release/serve_text_file /usr/src/app/
COPY --from=builder /usr/src/app/text.txt /usr/src/app

# Expose the application's port (only in the production stage)
EXPOSE 8080

# Run the compiled binary
CMD ["/usr/src/app/serve_text_file"]

