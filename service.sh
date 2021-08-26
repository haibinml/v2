# 开机之后执行
#!/system/bin/sh
# 不要假设您的模块将位于何处。
# 如果您需要知道此脚本和模块的放置位置，请使用$MODDIR
# 这将确保您的模块仍能正常工作
# 即使Magisk将来更改其挂载点
MODDIR=${0%/*}

[ -d /data/v2/ ] || cp -af ${0%/*}/v2 /data/v2

sleep 20

/data/v2/"开启".sh start

# 此脚本将在late_start service 模式执行
