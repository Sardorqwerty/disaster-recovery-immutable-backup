#!/bin/bash
set -e

export PATH="/usr/local/bin:/usr/bin:/bin"
export RESTIC_REPOSITORY="rest:http://restic:rest@10.99.0.20:8000/"
export RESTIC_PASSWORD_FILE="/home/user/.restic-password"

restic backup /opt/portfolio-data
