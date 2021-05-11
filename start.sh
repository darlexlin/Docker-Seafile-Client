#!/bin/bash
echo "-------------------------------------"
echo "                                     "
echo “TIME：$(date)”
echo "                                     "
echo "-------------------------------------"
echo "                                     "
/usr/bin/seaf-cli start
echo "                                     "
echo "-------------------------------------"
echo "                                     "
echo "        seafile started       "
echo "                                     "
echo "-------------------------------------"
tail -f /dev/null
