#!/bin/bash

exec 3>&1
exec 1> testout
echo 1
echo 2

exec 1>&3
#exec 3>est3out
echo 3 
