from flask import Flask
from prometheus_client import Counter, generate_latest
import random

app = Flask(__name__)

# Counter for application errors
error_counter = Counter(
    "app_errors_total",
    "Total number of simulated application errors"
)

@app.route("/")
def home():
    """
    30% chance to simulate an application error (HTTP 500).
    On error, increment the app_errors_total metric.
    """
    if random.random() < 0.30:
        error_counter.inc()
        return "Simulated application error!", 500
    return "App is healthy!"

@app.route("/metrics")
def metrics():
    """
    Standard Prometheus scrape endpoint.
    Exposes app_errors_total and default Python process metrics.
    """
    return generate_latest(), 200, {"Content-Type": "text/plain; charset=utf-8"}

if __name__ == "__main__":
    # Dev server is fine for demo. In prod, use gunicorn/uvicorn.
    app.run(host="0.0.0.0", port=5000)