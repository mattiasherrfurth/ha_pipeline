# syntax=docker/dockerfile:1
FROM python:3.12-slim-trixie AS build
ENV PIP_NO_CACHE_DIR=1 PIP_DISABLE_PIP_VERSION_CHECK=1
WORKDIR /src
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
COPY requirements.lock .
RUN pip install --require-hashes -r requirements.lock
COPY pyproject.toml .
COPY src ./src
RUN pip install --no-deps .

FROM python:3.12-slim-trixie
ENV PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1 PATH="/opt/venv/bin:$PATH"
COPY --from=build /opt/venv /opt/venv
RUN useradd --uid 10001 --no-create-home --shell /usr/sbin/nologin app
USER 10001
EXPOSE 8080
ENTRYPOINT ["ha-connector"]
