#!/bin/sh
curl -s https://missing.csail.mit.edu/ | grep "href=\"/20" | wc -l
