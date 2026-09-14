import subprocess

subprocess.Popen(cmd, shell=True)
subprocess.Popen(
    cmd,
    shell=True,
)
subprocess.Popen(cmd, shell = True)
subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
subprocess.Popen(["sh", "-c", cmd])

# 注释里的 subprocess.Popen(cmd, shell=True) 不应算作真实调用
text = "subprocess.Popen(cmd, shell=True)"  # 字符串里的同样不算
