# Eighty Columns

Coming-soon page for [eightycolumn.eu](https://eightycolumn.eu).

A single static page: an IBM-style 80-column punch card with "COMING SOON"
punched in Hollerith code, one column at a time.

## Layout

- `public/` — everything that gets served (just `index.html`, no build step)
- `deploy.sh` — pushes and makes the server pick it up immediately

## Run locally

Open `public/index.html` in a browser.

## Deploy

Push to `main`. The VPS keeps a clone of this repo and pulls `origin/main`
every 2 minutes; a small Caddy container serves its `public/` folder read-only
behind the shared Caddy reverse proxy. No secrets are stored on GitHub: the
repo is public, so the server needs no credentials to pull.

To go live right away instead of within 2 minutes:

```bash
./deploy.sh
```

Anything edited directly in the server's clone is overwritten on the next pull.
