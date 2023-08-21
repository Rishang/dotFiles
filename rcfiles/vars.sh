#!/usr/bin/bash

# grep regex
grep_strings="(\"[^\"]+\"|'[^']+')"

grep_ip="(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])"

grep_jwt="ey([0-9a-zA-Z]+)\\.ey([0-9a-zA-Z]+)\\.([[0-9A-Za-z-]+)"

grep_urls="((http|https|s3):\\/\\/)([a-zA-Z0-9_\-]+\\.)+[a-zA-Z0-9_\\-]+(\\/[a-zA-Z0-9\\.\\#_\\-]+)*"

grep_email="([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\.([a-zA-Z]{2,5})"

grep_secret="passw(or)?d|secret|token|api|key|auth|credential|access|mysql|postgres|db|database|user|username|pwd|passwd|password|secret|token|api|key|auth|credential|access|mysql|postgres|db|database|user|username|pwd|passwd"

grep_aws_access_key="AKIA[0-9A-Z]{16}"

