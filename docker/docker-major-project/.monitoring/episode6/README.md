# Episode 5 – Instrumented App & Failure Alerts

## Overview
We now instrument the Flask app with Prometheus client libraries so application errors show up as first‑class metrics (`app_errors_total`). Prometheus scrapes the app, Alertmanager distributes notifications, Grafana visualizes, and a helper script generates load to validate the pipeline end to end.

## Stack Components
- `app/app.py` – exposes `/metrics` and increments a counter whenever simulated failures occur.
- `prometheus/prometheus.yml` & `prometheus/alert_rules.yml` – scrape Prometheus, Node Exporter, and the app; trigger `AppErrorRateHigh`.
- `alertmanager/alertmanager.yml` – single Slack receiver.
- `docker-compose.yml` – runs the app, Prometheus, Alertmanager, Node Exporter, and Grafana.
- `scripts/fire_errors.sh` – curls the home page repeatedly to trigger HTTP 500s.

## Run the Demo
1. `docker compose up --build`.
2. Run `./scripts/fire_errors.sh 50` to generate errors.
3. Watch Prometheus (`http://localhost:9090/graph?g0.expr=app_errors_total`) and the Alertmanager UI (`http://localhost:9093`) as alerts fire.

## Practice Exercises
1. Split `app_errors_total` into labeled counters (e.g., by endpoint or error type) and update the alert rule accordingly.
2. Add a latency histogram to the Flask app and graph P95/P99 response times in Grafana.
3. Configure Alertmanager to notify different channels based on severity or service.
4. Container harden the app (gunicorn, health probes) to simulate production readiness.

## 1:1 Hands-On Incident Support

If you’re serious about DevOps and want hands-on incident practice, CI/CD practice packs, or a 1:1 session, book here:
https://topmate.io/learnwithdevopsengineer