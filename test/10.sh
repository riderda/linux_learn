#!/bin/bash

exec > test.out
echo "this script ran at $(date +%B%d,%T)"
echo 
sleep 5
echo "this script'end..."
