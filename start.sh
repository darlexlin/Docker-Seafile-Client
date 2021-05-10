#!/bin/bash
echo “$(date)”
/usr/bin/seaf-cli start
echo "--- seafile started ---"
tail -f /dev/null
