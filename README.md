# Cricket

Cricket is a minimal HTTP service intended for **smoke testing deployments, networking, and load balancing**.

It is deliberately small and boring: a single-process Node.js service that listens on a port, responds to HTTP requests, and exposes basic Prometheus metrics. The goal is not to build an application, but to provide a **simple, observable workload** with no external service dependencies that can be containerized, deployed, and exercised in different environments.

---

## What this is for

Cricket is useful when you want to quickly answer questions like:

* Can I reach this service from another host or network?
* Am I hitting multiple instances behind a load balancer?
* Is traffic flowing the way I expect it to?
* Can Prometheus scrape metrics from this deployment?

Because it is stateless and has no external dependencies, it works equally well when run:

* directly on a host or VM
* inside a Docker container
* behind a load balancer
* inside a container orchestration platform

---

## Behavior

The service listens on a configurable port (default: `8080`) and exposes two behaviors:

* `GET /metrics`

  * Exposes Prometheus metrics via `prom-client`

* `GET /<any other path>`

  * Increments a request counter
  * Returns a JSON response containing:

    * the hostname
    * the process ID
    * the request path
    * the client IP (as seen by the service)

This makes it easy to see which instance handled a request and how traffic is being distributed.

---

## Configuration

* `PORT` — Port to listen on (default: `8080`)

No other configuration is required.

---

## Running locally

```bash
npm install
node index.js
```

Then:

```bash
curl http://localhost:8080/
curl http://localhost:8080/metrics
```

---

## Intended use

This repository exists primarily as:

* a small utility for ad-hoc testing
* an example of containerization and CI/CD workflows
* a demonstration of release hygiene and automation

It is not intended to be a production application.

---

## License

ISC
