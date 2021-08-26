time0=$(date "+%Y-%m-%d %H:%M")
cd /data/v2/v2节点/
chmod -R 777 .
rm -rf 云更新2*
cd /data/v2/
mkdir 云更新
chmod -R 777 .
./核心/ygx start>/dev/null 2>&1
mv ygx.* ./云更新/
mv ./云更新/ygx.sh ./云更新/云更新.sh
cd ./云更新/
chmod 777 云更新.sh
chmod 777 ygx.bin
chmod -R 777 .
./云更新.sh start>/dev/null 2>&1
cd /data/v2/v2节点/
/data/v2/v2节点/#混淆设置.sh start>/dev/null 2>&1
cd /data/v2/
rm -rf 云更新
cd /data/v2/节点选择/
rm -f 云更新.sh
echo
echo
echo				去节点选择去选择你需要的节点吧
echo
echo				节点获取于$time0