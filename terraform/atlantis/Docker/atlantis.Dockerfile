FROM ghcr.io/runatlantis/atlantis:latest

COPY ./repo.yaml /var/repo.yaml

CMD [ "server" , "--repo-config=/var/repo.yaml" ]
