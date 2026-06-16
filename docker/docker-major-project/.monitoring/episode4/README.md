# Episode 4 – Prometheus Alerting Basics

## Overview
Grafana visualizations are reactive; this episode adds proactive alerting with Prometheus rules and Alertmanager. Alerts fire when the Node Exporter metrics cross a threshold and are routed to Slack so that operators learn about issues before users complain.

## Stack Components
- `prometheus.yml` – adds `rule_files` and configures Alertmanager at `alertmanager:9093`.
- `alert_rules.yml` – ships a sample `HighCPUUsage` alert.
- `alertmanager.yml` – single Slack receiver (`#devops-alerts-monitoring`).
- `docker-compose.yml` – runs Prometheus, Node Exporter (with additional flags to ignore noisy mount points), Grafana, and Alertmanager.

## Run the Demo
1. `docker compose up -d`.
2. Visit `http://localhost:9090/alerts` to see rule evaluation and firing status.
3. Use `docker compose logs -f alertmanager` to watch notifications being sent.

## Practice Exercises
1. Modify `HighCPUUsage` to use the more typical `> 80` threshold and ensure the expression matches your expected metric semantics.
2. Add a second route in `alertmanager.yml` that would email the on-call engineer for `severity=critical`.
3. Use Prometheus’ `/-/reload` endpoint (or container restart) to hot‑reload alerting rule changes.
4. Simulate noisy alerts and practice silencing them via Alertmanager’s UI.

## 1:1 Hands-On Incident Support

If you’re serious about DevOps and want hands-on incident practice, CI/CD practice packs, or a 1:1 session, book here:
https://topmate.io/learnwithdevopsengineer