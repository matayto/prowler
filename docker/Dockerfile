# stage 1, install deps
FROM python:3.8-alpine AS builder
WORKDIR /app
ENV DYNAMODB_REPORT_TABLE=DYNAMODB_REPORT_TABLE
ENV AWS_REGION=AWS_REGION

RUN python -m venv .venv && .venv/bin/pip install --no-cache-dir -U pip setuptools
COPY requirements.txt .
RUN \
  .venv/bin/pip install --no-cache-dir -r requirements.txt && \
  find /app/.venv \( -type d -a -name test -o -name tests \) -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -delete
  
# stage 2, only necessary files
FROM python:3.8-alpine
WORKDIR /app
COPY --from=builder /app /app
COPY script .
ENV PATH="/app/.venv/bin:$PATH"
ENTRYPOINT "/app/script"
