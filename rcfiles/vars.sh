#!/usr/bin/bash

# grep regex
grep_strings="(\"[^\"]+\"|'[^']+')"
grep_urls="https?://[^\"\\'> ]+"
grep_ip="(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])"
grep_jwt="ey([0-9a-zA-Z]+)\.ey([0-9a-zA-Z]+)\.([[0-9A-Za-z-]+)"
