#!/bin/sh
# 在代码中查找 subprocess.Popen(..., shell=True)
grep -rnP 'subprocess\.Popen\([^)]*shell\s*=\s*True' .
