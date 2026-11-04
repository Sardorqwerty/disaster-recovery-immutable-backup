#!/bin/bash
set -euo pipefail

export PATH="/usr/local/bin:/usr/bin:/bin"

# Repository manzili va maxfiy ma'lumotlar serverda alohida sozlanadi.
: "${RESTIC_REPOSITORY:?Set RESTIC_REPOSITORY environment variable}"
: "${RESTIC_PASSWORD_FILE:?Set RESTIC_PASSWORD_FILE environment variable}"
: "${RESTIC_REST_USERNAME:?Set RESTIC_REST_USERNAME environment variable}"
: "${RESTIC_REST_PASSWORD:?Set RESTIC_REST_PASSWORD environment variable}"

restic backup /opt/portfolio-data
