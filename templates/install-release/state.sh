#!/bin/bash
install-release state | jq -r "." > state.json