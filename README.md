# Dgraph Alpha + Zero (Railway Template Fork)

**Purpose**: Modified Railway Dgraph template for Docuvera Librarian production deployment.

## Why This Fork Exists

Forked from [`railwayapp-templates/dgraph_alpha_zero`](https://github.com/railwayapp-templates/dgraph_alpha_zero) to fix IP whitelist compatibility with Railway's internal networking.

### Change Made

**File**: `start.sh`  
**Line**: Dgraph alpha security whitelist  
**Original**: `--security whitelist="100.0.0.0/8"`  
**Modified**: `--security whitelist="0.0.0.0/0"`

### Why This Change

Railway's internal container networking assigns IPs in the `10.x.x.x` range, which were blocked by the original `100.0.0.0/8` whitelist. Changing to `0.0.0.0/0` allows all IPs.

**Security**: Safe because Dgraph is only accessible via Railway's private network (`alpha-zero.railway.internal`), not the public internet. Application-layer authentication is handled by Next.js/Auth.js.

## Maintenance

**DO NOT** add application code or sensitive data to this repository. This is infrastructure configuration only.

**Update Strategy**: Monitor upstream template for Dgraph version updates or security fixes. Merge changes and maintain our whitelist modification.

## Related Documentation

- [ADR-002: Railway Container Template Strategy](https://github.com/mwdv6/design-system/blob/main/docuvera-librarian/docs/architecture/adr-002-railway-container-templates.md)
- [Dgraph Railway Deployment Guide](https://github.com/mwdv6/design-system/blob/main/docuvera-librarian/memory/dgraph-railway-deployment-guide.md)

## Upstream

- **Template**: https://github.com/railwayapp-templates/dgraph_alpha_zero
- **License**: MIT (inherited from upstream)
- **Dgraph Version**: Uses `dgraph/dgraph:latest` from Docker Hub
