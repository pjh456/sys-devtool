#!/usr/bin/env python3
"""从标准输入读取一个 JSON 对象，输出其中的 name 字段。"""
import json
import sys

print(json.load(sys.stdin)["name"])
