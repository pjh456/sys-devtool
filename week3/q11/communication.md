# Issue
- 环境：Linux，Python 3.12，greetlab 0.1.0（Windows 影响待确认）
- 复现命令：`sdt-greet --name " "`
- 期望结果：报告 --name 用法错误，退出码 2
- 实际结果：输出 `Hello,  !`，退出码 0
- 备注：原 Issue “Windows 上运行不了” 无复现记录，待确认

# 提交信息
fix: 拒绝仅含空白字符的 --name 值
problem: 纯空白姓名被当作合法输入，正常打印问候且退出码 0，调用方无法发现错误。
solution: 解析后用 strip() 校验，空白时以 p.error() 报错并退出 2。

# 评审意见
[Blocking]
- 行为：name 全为空白时 main 仍打印问候语并以 0 退出
- 风险：上游依赖退出码判断输入合法性，空白姓名会被静默接受
- 建议：增加空白校验并以 2 退出，并补充回归测试
