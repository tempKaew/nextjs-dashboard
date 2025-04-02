# NextJS Admin Dashboard

## Description

เป็นการสร้าง dashboard เพื่อเรียนรู้ nextjs

## Prerequisites

Before running this project, ensure you have the following installed:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Make](https://www.gnu.org/software/make/)

## Setup Instructions

### 1. Clone the Repository

```sh
git clone https://github.com/tempKaew/nextjs-dashboard.git
cd nextjs-dashboard
```

### 2. Initialize the Project

Copy the environment configuration file and start the development environment:

```sh
make init-project
```

This command will:

- Copy `.env.example` to `.env`
- Start the development environment using Docker Compose

### 3. Running the Project

#### Start the Development Environment

```sh
make up
```

This command will start all necessary containers in detached mode (`-d`).

#### Stop the Development Environment

```sh
make down
```

This command will stop and remove all running containers.

#### Rebuild the Development Environment

```sh
make rebuild
```

This command will rebuild the application from scratch without using cache.

#### Access the Web Container

```sh
make web
```

This command will open a shell inside the web container.

### 4. Running in Production

#### Build and Start Production

```sh
make prod-build
make prod-up
```

This will build and start the production environment.

#### Stop Production Environment

```sh
make prod-down
```

This command will stop and remove the production environment.

#### Rebuild Production Environment

```sh
make prod-rebuild
```

This will rebuild the production containers from scratch without using cache.

### 5. Check Container Status

```sh
make ps
```

This command will display the status of running containers.

### 6. Pull Latest Docker Images

```sh
make pull
```

This command fetches the latest Docker images from the registry.

## Additional Notes

- The `Makefile` is used to simplify Docker-related commands.
- The development and production environments use separate `docker-compose.yml` files for configuration.
- Use `make help` to see a list of available commands.
