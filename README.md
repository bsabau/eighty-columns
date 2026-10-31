# Eighty Columns

Coming-soon page for [eightycolumn.eu](https://eightycolumn.eu).

A single static page: an IBM-style 80-column punch card with "COMING SOON"
punched in Hollerith code, one column at a time.

## Layout

- `public/` — everything that gets served (just `index.html`, no build step)
- `deploy.sh` — pushes and makes the server pull it

## Run locally

Open `public/index.html` in a browser.

## Deploy

```bash
./deploy.sh
```

This pushes `main` to GitHub, then SSHes into the VPS and pulls it. The VPS
keeps a clone of this repo; a small Caddy container serves its `public/` folder
read-only behind the shared Caddy reverse proxy. The repo is public, so the
server needs no credentials to pull.

Anything edited directly in the server's clone is overwritten on the next pull.
