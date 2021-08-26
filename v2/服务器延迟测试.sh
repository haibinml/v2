if [ -f ping.txt ]; then 
rm -r ping.txt; 
fi
cd ${0%/*}/核心
files="/data/v2/v2节点"
for file in $files/*
do
filenameini="basename $file"
filename=`echo ${filenameini%.*}`
addr=`cat $file | grep "addr" | cut -d '"' -f 2 | cut -d '=' -f 2 | cut -d ':' -f 1`
naip="$filename"-"$addr"
$naip >> ${0%/*}/核心/ip
done

echo -e "\n\n\n\n\n\n\n\n\n\n在测延迟之前必须关闭clnc和v2等代理工具\n\n只支持直连节点，理论上不支持中转节点\n\n所以，仅供参考🤔\n\n\033[0;32m正在测试延迟...\033[0m\n\n可以返回或放后台等待测试结果\n\n测试过程会输出ping（测试中）.txt\n\n测试完成后会输出ping.txt文件"

while read line
do
ip=`echo ${line##*-}`
ping=`setsid ping -c 50 -w 4 -A -q $ip`
avgping=$(echo "$ping" | grep "rtt" | cut -d '=' -f 2 | cut -d '/' -f 2)
avgpingzs=$(echo "$avgping" | cut -d '.' -f 1)
if [[ "$avgping" = "" ]];then
zt="❌无法连接"
elif [[ "$avgpingzs" -ge 0 && "$avgpingzs" -le 40 ]];then
zt="🟢极速"
elif [[ "$avgpingzs" -ge 40 && "$avgpingzs" -le 70 ]];then
zt="🔵良好"
elif [[ "$avgpingzs" -ge 70 && "$avgpingzs" -le 150 ]];then
zt="🟡一般"
elif [[ "$avgpingzs" -ge 150 ]];then
zt="🔴较差"
fi
echo "延迟:$avgping"ms  $zt ｜ "$line" >> ${0%/*}/ping（测试中）.txt
done < ip

echo "\033[0;32mping值已输出→ping.txt\033[0m"
rm -r ${0%/*}/核心/ip
cd ${0%/*}
mv ping（测试中）.txt ping.txt
echo "\n测出ping值不代表节点有网，没有ping值也不代表节点没网，ping低也不代表体验就好\n仅供参考，实际体验可能有很大差别" >> ${0%/*}/ping.txt