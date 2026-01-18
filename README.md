# Bagisto Base

A Laravel application boilerplate with Bagisto admin panel, containerized with Docker.

## Technologies

This project is built with the following technologies:

| Technology                              | Description |
|-----------------------------------------|-------------|
| [PHP](https://php.net)                  | Server-side scripting language |
| [Laravel](https://laravel.com)          | PHP web application framework |
| [Bagisto](https://devdocs.bagisto.com) | Free and open source laravel eCommerce platform |
| [Tailwind CSS](https://tailwindcss.com) | Utility-first CSS framework |
| [Vite](https://vitejs.dev)              | Next generation frontend tooling |
| [MariaDB](https://mariadb.org)          | Relational database |
| [Redis](https://redis.io)               | In-memory data store for caching and queues |
| [Nginx](https://nginx.org)              | Web server |
| [Docker](https://docker.com)            | Containerization platform |

## Services & Access

The application runs in Docker containers with Traefik as a reverse proxy. The following services are available:

| Service | URL                                   | Description |
|---------|---------------------------------------|-------------|
| Application | `http://bagisto-base.localhost`       | Main Laravel application |
| phpMyAdmin | `http://pma.bagisto-base.localhost`   | Database management interface |
| Redis Insight | `http://redis.bagisto-base.localhost` | Redis database GUI |
| Database | `localhost:3366`                      | MariaDB direct connection |

## Credentials

### Admin User (Bagisto)

| Field | Value                          |
|-------|--------------------------------|
| Email | `admin@bagisto-base.localhost` |
| Password | `secret`                       |

### Database (MariaDB)

| Field | Value                                                        |
|-------|--------------------------------------------------------------|
| Host | `database` (from containers) or `localhost:3366` (from host) |
| Database | `bagisto-base`                                               |
| Username | `root`                                                       |
| Password | `a`                                                          |

### phpMyAdmin

Use the database credentials above to log in.

| Field | Value |
|-------|-------|
| Server | `database` (pre-configured) |
| Username | `root` |
| Password | `a` |

### Redis

| Field | Value |
|-------|-------|
| Host | `redis` |
| Port | `6379` |

## Getting Started

1. Start the Docker containers (this will automatically copy `.env.example` to `.env`):
   ```bash
   make up
   ```

2. Enter the PHP container shell:
   ```bash
   make php_shell
   ```

3. Install dependencies and setup the application (inside the container):
   ```bash
   composer setup
   ```

4. Access the application at http://bagisto-base.localhost

## Available Make Commands

| Command | Description |
|---------|-------------|
| `make up` | Start all Docker containers (builds and runs in detached mode) |
| `make down` | Stop all Docker containers |
| `make ps` | Show running containers status |
| `make php_shell` | Open a bash shell in the PHP container |
| `make prune` | Stop containers, remove volumes, and clean up `.env` and storage files |

## License

This project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
