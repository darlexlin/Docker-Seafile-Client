#!/bin/bash
echo "-------------------------------------"
echo "                                     "
echo “TIME：$(date)”
echo "                                     "
/usr/bin/seaf-cli start
echo "                                     "
echo "--------   seafile started   --------"
tail -f /dev/null
