# Dgraph Alpha + Zero - Railway Template

Modified Railway Dgraph template with adjusted IP whitelist configuration.

## Changes from Upstream

- Whitelist changed from `100.0.0.0/8` to `0.0.0.0/0` in `start.sh`
- Fixes ACL blocking Railway's internal container IPs (10.x.x.x range)

## Upstream

Forked from [`railwayapp-templates/dgraph_alpha_zero`](https://github.com/railwayapp-templates/dgraph_alpha_zero)

## License

MIT (inherited from upstream)
