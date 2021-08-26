cd /data/v2/
chmod -R 777 .
./关闭.sh
project_name="v2xray"
name=`echo $project_name`
filename="${name%.*}"
sed -i "/exec=/cexec=$filename" config.ini
chmod -R 777 .
./开启.sh
echo -e "
- 成功更换xray内核，并已重新启动"
