#!/bin/bash

# Install Anchore Syft
sudo curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin

# Install Grype
sudo curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin
# Create SBOM and run scan

sudo syft / -o spdx-json=sbom.spdx.json

grype --only-fixed sbom.spdx.json >> grype_report.txt
