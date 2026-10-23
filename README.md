# Hoffman Gallery

Photography gallery organised into collections, with author credit. Skeleton.

## Status

Skeleton. This repository holds the layout, interfaces and decisions. The working implementation is not published.

## Why

A place to show photo series as series, with cover, date and count, instead of one long scroll.

## Architecture

A static front end renders collection cards and collection pages from a small JSON API. The API reads collection metadata and image files from a data directory outside the repository. Uploads are accepted only from authenticated clients and are size- and type-limited.

More in [docs/architecture.md](docs/architecture.md).

## Layout

- `public/` static front end
- `server/` HTTP server (stub)
- `data/` metadata schema examples only
- `docs/` architecture and ADRs

## Run

```sh
cp .env.example .env
npm start   # serves /healthz only
```

## Design decisions

- [0001 Collections are first-class, front end stays static](docs/adr/0001-collections-are-first-class-front-end-stays-static.md)

## Roadmap

- [ ] Collection API (list, read)
- [ ] Collection page with lazy-loaded images
- [ ] Authenticated upload with limits
- [ ] Author credit and bio block
- [ ] Image resizing pipeline

## Security

See [SECURITY.md](SECURITY.md). CI runs a leak scan on every push.

## License

MIT, see [LICENSE](LICENSE).
