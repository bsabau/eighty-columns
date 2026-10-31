# Eighty Columns

Coming-soon page for [eightycolumn.eu](https://eightycolumn.eu).

A single static page: an IBM-style 80-column punch card with "COMING SOON"
punched in Hollerith code, one column at a time.

## Layout

- `public/` — everything that gets served (just `index.html`, no build step)
- `deploy.sh` — uploads `public/` to the server

## Run locally

Open `public/index.html` in a browser.

## Deploy

```bash
./deploy.sh
```

This rsyncs `public/` to the VPS, where a small Caddy container serves it
read-only behind the shared Caddy reverse proxy. Changes are live as soon as
the upload finishes. Override the target with `VPS=user@host` or `REMOTE_DIR=…`.
