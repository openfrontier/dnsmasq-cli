# Quick start

- `echo LISTEN_ADDR=<dns-server-ip> > .env`
- `docker-compose up -d`
- `docker-compose -f test-compose.yml run --rm client /usr/bin/env sh`
- `nslookup www.google.com`

# Add local domain

- `mkdir hostsdata`
- `echo <ip addrss> <domain-name> > hosts`
