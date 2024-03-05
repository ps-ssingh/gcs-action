FROM google/cloud-sdk:293.0.0-alpine

COPY README.md /

COPY entry.sh /entry.sh
ENTRYPOINT ["sh", "/entry.sh"]
