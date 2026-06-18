# Laravel React Next.js Microservices — Ecommerce Platform

A full-stack ecommerce platform built with a **monolith-first microservices architecture**. A single Laravel backend powers three independent frontends — a React Admin panel, a React Influencer portal, and a Next.js Checkout — all orchestrated with Docker Compose.

---

## Architecture Overview

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   react-admin   │    │ react-influencer  │    │  next-checkout  │
│  (React + CRA)  │    │  (React + Nginx)  │    │   (Next.js 14)  │
│   localhost:3000│    │  localhost:3001   │    │  localhost:3002 │
└────────┬────────┘    └────────┬─────────┘    └────────┬────────┘
         │                      │                        │
         └──────────────────────┼────────────────────────┘
                                ▼
                    ┌───────────────────────┐
                    │     laravel-admin     │
                    │  (PHP 8.3 / Laravel)  │
                    │    localhost:8000     │
                    │                       │
                    │  Auth · Users · Redis │
                    │  Stripe · RabbitMQ    │
                    └──────────┬────────────┘
                               │
              ┌────────────────┼────────────────┐
              ▼                ▼                ▼
         ┌─────────┐    ┌──────────┐    ┌───────────────┐
         │  MySQL  │    │  Redis   │    │ emails service│
         │ :33066  │    │ (cache)  │    │  (RabbitMQ    │
         └─────────┘    └──────────┘    │   consumer)   │
                                        └───────────────┘
```

---

## Services & Ports

| Service            | Description                       | Local URL               |
|--------------------|-----------------------------------|-------------------------|
| `laravel-admin`    | Laravel REST API (backend)        | http://localhost:8000   |
| `react-admin`      | Admin dashboard (React CRA)       | http://localhost:3000   |
| `react-influencer` | Influencer portal (React + Nginx) | http://localhost:3001   |
| `next-checkout`    | Checkout frontend (Next.js)       | http://localhost:3002   |
| `db`               | MySQL 9.7 database                | localhost:33066         |
| `phpmyadmin`       | Database GUI                      | http://localhost:8080   |
| `redis`            | Cache & queue driver              | Internal only           |
| `emails`           | Email queue worker (RabbitMQ)     | Internal only           |
| `mailpit`          | Local mail catcher (dev)          | http://localhost:8025   |

---

## Prerequisites

Make sure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/) v24+
- [Docker Compose](https://docs.docker.com/compose/install/) v2.20+
- Git

> No PHP, Node.js, or Composer needed locally — everything runs inside Docker.

---

## ⚠️ Important: Environment Files Are Not Committed

This project uses `.gitignore` to exclude all `.env` files from version control to protect secrets. **You must create these files manually** before running the project.

The following env files are gitignored and must be created:

| File                  | Gitignored by         | Required? |
|-----------------------|-----------------------|-----------|
| `.env`                | root `.gitignore`     | ✅ Yes    |
| `laravel-admin/.env`  | root `.gitignore`     | ✅ Yes    |
| `emails/.env`         | root `.gitignore`     | ✅ Yes    |
| `next-checkout/.env*` | next-checkout ignore  | Optional  |
| `react-admin/.env.*`  | react-admin ignore    | Optional  |
| `react-influencer/.env.*` | react-influencer ignore | Optional |

The setup steps below walk through creating each one.

---

## Setup Guide

### Step 1 — Clone the repository

```bash
git clone https://github.com/SahariarIslm/reactjs-laravel-nextjs-microservices.git
cd reactjs-laravel-nextjs-microservices
```

---

### Step 2 — Create the root `.env` file

The root `.env` is consumed by `docker-compose.yml` to inject secrets into containers at runtime.

```bash
# From the project root
touch .env
```

Paste the following into `.env` and fill in your values:

```env
# ─── Laravel Admin App Key ───────────────────────────────────────────────────
# Generate one at: https://generate-random.org/laravel-key-generator
# Or run after first boot: docker exec -it laravel-admin php artisan key:generate --show
ADMIN_APP_KEY=base64:REPLACE_WITH_YOUR_LARAVEL_KEY

# ─── Emails Service App Key ──────────────────────────────────────────────────
EMAIL_APP_KEY=base64:REPLACE_WITH_YOUR_EMAIL_SERVICE_KEY

# ─── RabbitMQ (external broker) ──────────────────────────────────────────────
# Free hosted option: https://www.cloudamqp.com (Little Lemur plan is free)
RABBITMQ_HOST=your-instance.cloudamqp.com
RABBITMQ_PORT=5671
RABBITMQ_USER=your_rabbitmq_user
RABBITMQ_PASSWORD=your_rabbitmq_password
RABBITMQ_VHOST=your_vhost

# ─── Mail (Mailpit is pre-configured for local dev — no changes needed) ──────
MAIL_MAILER=mailpit
MAIL_HOST=mailpit
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_FROM_ADDRESS=hello@example.com
MAIL_FROM_NAME=MyApp
```

---

### Step 3 — Create `laravel-admin/.env`

This file configures the Laravel API service itself (separate from the Docker Compose env).

```bash
cp laravel-admin/.env.example laravel-admin/.env
```

Then open `laravel-admin/.env` and make sure these values match your root `.env` and `docker-compose.yml`:

```env
APP_NAME=LaravelAdmin
APP_ENV=local
APP_KEY=                         # Leave blank — will be generated in Step 6
APP_DEBUG=true
APP_URL=http://localhost:8000

LOG_CHANNEL=stack
LOG_LEVEL=debug

# Database — matches docker-compose.yml db service
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=influencer
DB_USERNAME=root
DB_PASSWORD=root

# Redis — matches docker-compose.yml redis service
REDIS_HOST=redis
REDIS_PORT=6379
REDIS_PASSWORD=null

# Queue — must be rabbitmq to use the email queue
QUEUE_CONNECTION=rabbitmq
RABBITMQ_HOST=your-instance.cloudamqp.com
RABBITMQ_PORT=5671
RABBITMQ_USER=your_rabbitmq_user
RABBITMQ_PASSWORD=your_rabbitmq_password
RABBITMQ_VHOST=your_vhost
RABBITMQ_QUEUE=email.queue

# Stripe
STRIPE_KEY=pk_test_your_stripe_public_key
STRIPE_SECRET=sk_test_your_stripe_secret_key

# Mail
MAIL_MAILER=mailpit
MAIL_HOST=mailpit
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_FROM_ADDRESS=hello@example.com
MAIL_FROM_NAME=MyApp
```

> **Note:** `DB_HOST=db` and `REDIS_HOST=redis` use Docker service names, not `localhost`. This is correct inside the Docker network.

---

### Step 4 — Create `emails/.env`

The emails service is a separate Laravel queue worker. It needs its own `.env`.

```bash
cp emails/.env.example emails/.env
```

Open `emails/.env` and configure:

```env
APP_NAME=EmailsService
APP_ENV=local
APP_KEY=                         # Leave blank — generated separately if needed
APP_DEBUG=true

LOG_CHANNEL=stack
LOG_LEVEL=debug

# Queue
QUEUE_CONNECTION=rabbitmq
RABBITMQ_HOST=your-instance.cloudamqp.com
RABBITMQ_PORT=5671
RABBITMQ_USER=your_rabbitmq_user
RABBITMQ_PASSWORD=your_rabbitmq_password
RABBITMQ_VHOST=your_vhost
RABBITMQ_QUEUE=email.queue

# Mail
MAIL_MAILER=mailpit
MAIL_HOST=mailpit
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_FROM_ADDRESS=hello@example.com
MAIL_FROM_NAME=MyApp
```

> **Note:** The emails service does not need a database connection — it only processes queue jobs and sends mail.

---

### Step 5 — (Optional) Frontend env files

The React and Next.js frontends get their API URLs injected at **Docker build time** via build args in `docker-compose.yml`, so you do **not** need to create `.env` files for them to work with Docker.

If you want to run a frontend locally outside Docker (e.g. for development with hot reload):

**`next-checkout/.env.local`**
```env
NEXT_PUBLIC_API_URL=http://localhost:8000/api/checkout
NEXT_PUBLIC_STRIPE_KEY=pk_test_your_stripe_public_key
```

**`react-admin/.env.local`**
```env
REACT_APP_API_URL=http://localhost:8000/api/admin
```

**`react-influencer/.env.local`**
```env
REACT_APP_API_URL=http://localhost:8000/api/influencer
REACT_APP_CHECKOUT_URL=http://localhost:3002
```

---

### Step 6 — Build and start all services

```bash
docker compose up --build
```

> The first build takes several minutes as Docker downloads base images and installs all PHP/Node dependencies. Subsequent starts are much faster.

To run in detached (background) mode:

```bash
docker compose up --build -d
```

---

### Step 7 — Generate Laravel app keys

After the containers are up, generate app keys for both Laravel services:

```bash
# Generate key for laravel-admin and copy it into laravel-admin/.env
docker exec -it laravel-admin php artisan key:generate

# Generate key for emails service and copy it into emails/.env
docker exec -it emails-service php artisan key:generate
```

Then update your **root `.env`** with those same generated keys:

```env
ADMIN_APP_KEY=base64:the_key_that_was_generated
EMAIL_APP_KEY=base64:the_key_that_was_generated
```

Restart the containers to pick up the new keys:

```bash
docker compose restart laravel-admin emails
```

---

### Step 8 — Import the database schema

```bash
docker exec -i mysql-db mysql -u root -proot influencer < Database/influencer.sql
```

---

### Step 9 — Run migrations (if needed)

```bash
docker exec -it laravel-admin php artisan migrate --force
```

---

## Accessing the Application

Once all containers are healthy:

| Panel              | URL                    | Credentials             |
|--------------------|------------------------|-------------------------|
| Admin Dashboard    | http://localhost:3000  | Set up via seeder       |
| Influencer Portal  | http://localhost:3001  | Register via the app    |
| Checkout           | http://localhost:3002  | Public-facing           |
| Laravel API        | http://localhost:8000  | API base URL            |
| phpMyAdmin         | http://localhost:8080  | root / root             |
| Mailpit (emails)   | http://localhost:8025  | No login required       |

---

## Useful Docker Commands

```bash
# View status of all containers
docker compose ps

# Follow logs for all services
docker compose logs -f

# Follow logs for a specific service
docker compose logs -f laravel-admin
docker compose logs -f emails-service

# Stop all containers (keeps data)
docker compose down

# Full reset — stop and delete all volumes including DB data
docker compose down -v

# Rebuild a single service after code changes
docker compose up --build laravel-admin

# Open a bash shell inside a running container
docker exec -it laravel-admin bash
docker exec -it emails-service bash
docker exec -it mysql-db bash

# Run Artisan commands
docker exec -it laravel-admin php artisan <command>
docker exec -it laravel-admin php artisan migrate:status
docker exec -it laravel-admin php artisan queue:work

# Clear Laravel caches
docker exec -it laravel-admin php artisan cache:clear
docker exec -it laravel-admin php artisan config:clear
docker exec -it laravel-admin php artisan route:clear
docker exec -it laravel-admin php artisan view:clear
```

---

## Project Structure

```
.
├── laravel-admin/          # Laravel 11 REST API — auth, products, orders, Stripe
│   ├── .env.example        # Copy to laravel-admin/.env and fill in values
│   └── Dockerfile
├── emails/                 # Laravel queue worker — RabbitMQ email consumer
│   ├── .env.example        # Copy to emails/.env and fill in values
│   └── Dockerfile
├── react-admin/            # React (CRA) admin dashboard
│   └── Dockerfile
├── react-influencer/       # React (CRA) influencer portal — served via Nginx
│   └── Dockerfile
├── next-checkout/          # Next.js 14 checkout — Stripe payments
│   └── Dockerfile
├── Database/
│   └── influencer.sql      # Full database schema + seed data
├── Diagrams/
│   ├── Microservice.png
│   ├── Monolyth.png
│   └── OrdersTableInDifferentServices.png
├── .env                    # ⚠️ Gitignored — create manually (see Step 2)
├── .env.example            # Template for root .env
├── .gitignore
├── docker-compose.yml
└── README.md
```

---

## Tech Stack

| Layer       | Technology                               |
|-------------|------------------------------------------|
| Backend API | PHP 8.3, Laravel 11                      |
| Admin UI    | React 18 (CRA), TypeScript               |
| Influencer  | React 18 (CRA), Nginx                    |
| Checkout    | Next.js 14, TypeScript, Stripe.js        |
| Database    | MySQL 9.7                                |
| Cache       | Redis (latest)                           |
| Queue       | RabbitMQ (external) + Laravel Queue      |
| Email       | Mailpit (dev), configurable SMTP (prod)  |
| Payments    | Stripe                                   |
| Containers  | Docker, Docker Compose                   |

---

## Troubleshooting

**`docker compose up` fails immediately — missing `.env` file**
You skipped one of the setup steps. Make sure all three env files exist: `.env`, `laravel-admin/.env`, and `emails/.env`. Re-read [Step 2](#step-2--create-the-root-env-file), [Step 3](#step-3--create-laravel-adminenv), and [Step 4](#step-4--create-emailsenv).

**`laravel-admin` crashes with "No application encryption key has been specified"**
The `APP_KEY` is missing in `laravel-admin/.env`. Run `docker exec -it laravel-admin php artisan key:generate` then restart: `docker compose restart laravel-admin`.

**`emails-service` keeps restarting — RabbitMQ connection refused**
Your RabbitMQ credentials in `.env` and `emails/.env` are wrong or the broker is unreachable. Double-check `RABBITMQ_HOST`, `RABBITMQ_USER`, `RABBITMQ_PASSWORD`, and `RABBITMQ_VHOST`. Use [CloudAMQP](https://www.cloudamqp.com/) for a free hosted broker.

**`laravel-admin` can't connect to MySQL — "Connection refused"**
MySQL takes ~15–20 seconds to initialise on first boot. Run `docker compose restart laravel-admin` once the `db` container shows healthy in `docker compose ps`.

**`SQLSTATE` error when running migrations**
The `influencer` database may not exist yet. Connect via phpMyAdmin at http://localhost:8080 and create it, or run: `docker exec -it mysql-db mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS influencer;"`.

**Port already in use**
Something on your machine is already using one of these ports: `3000`, `3001`, `3002`, `8000`, `8025`, `8080`, `33066`. Stop the conflicting process, or change the left-hand port number in `docker-compose.yml` (e.g. `"3010:3000"`).

**`npm install` or `composer install` fails during build**
Run `docker compose build --no-cache <service-name>` to force a clean rebuild without cached layers.

**Frontend shows blank page or API errors**
The React/Next.js frontends bake the API URL in at build time. If you changed `laravel-admin`'s port, rebuild the frontend containers: `docker compose up --build react-admin react-influencer next-checkout`.

---

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

## License

[MIT](LICENSE)
