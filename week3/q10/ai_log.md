# AI LOG
- 提示词：修改 src/greetlab/cli.py，使 --name 全为空白字符时 main 以 SystemExit(2) 结束，并用仓库虚拟环境运行 pytest 验证。
- 智能体改动：cli.py 仅 +2 行：parse 后 `if not a.name.strip(): p.error("argument --name: value must not be blank")`，p.error 以 SystemExit(2) 退出；diff 无其他文件改动。
- 人工验证：diff 审查通过，无无关修改；`pytest tests/ -q` 1 passed；运行 `sdt-greet --name " "` 退出码 2，`--name alice` 正常输出且退出码 0。
