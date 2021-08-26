#!/system/bin/sh







#在下面url的双引号里面填入订阅链接
url=""


#在下面host的双引号里面修改混淆
host=""   



#在下面name的双引号里面填写订阅名称
name=""
#不填默认没有


#是否为订阅里的节点加序号
number=""
#填1打开，其他选项为关闭
#如果订阅里的节点有重复名的必须打开此选项，不然导入不完全
#一般情况不用打开







#感谢某个大佬写的订阅脚本

















































































green='\033[0;32m'
plain='\033[0m'
echo -e "${green}正在获取节点信息....${plain}"
curPath=$(readlink -f "$(dirname "$0")")

#echo $curPath
#curl -s -o link $url
$curPath/核心/wget -O link $url
base64 -d link > vm

while read -r line
do
 ccc=$(echo -n $line | echo ${line#*://} | xargs echo -n | base64 -d)
 ddd=$(echo -e "$ccc" | sed -e "s/,/\n/g")
 uuid=$(echo "$ddd" | grep "\"id\":" | sed -e "s/\"//g" | cut -d ":" -f2)
 add=$(echo "$ddd" | grep "\"add\":" | sed -e "s/\"//g" | cut -d ":" -f2)
 port=$(echo "$ddd" | grep "\"port\":" | sed -e "s/\"//g" | cut -d ":" -f2)
 aid=$(echo "$ddd" | grep "\"aid\":" | sed -e "s/\"//g" | cut -d ":" -f2)
 Type=$(echo "$ddd" | grep "\"type\":" | sed -e "s/\"//g" | cut -d ":" -f2)
 net=$(echo "$ddd" | grep "\"net\":" | sed -e "s/\"//g" | cut -d ":" -f2)
 path=$(echo "$ddd" | grep "\"path\":" | sed -e "s/\"//g" | cut -d ":" -f2)
 remarkfalse=$(echo "$ddd" | grep "\"ps\":" | sed -e "s/\"//g;s/ //g" | cut -d ":" -f2)
 remark=`echo $remarkfalse | sed 's/-//g' | sed 's/|//g' | sed 's/(//g' | sed 's/)//g' | sed 's/🇺🇲//g' | sed 's/🇸🇬//g' | sed 's/🇷🇺//g' | sed 's/🇰🇷//g' | sed 's/🇯🇵//g' | sed 's/🇮🇳//g' | sed 's/🇭🇰//g' | sed 's/🇬🇧//g' | sed 's/🇩🇪//g' | sed 's/🇨🇳//g' | sed 's/🇨🇦//g' | sed 's/🇧🇷//g' | sed 's/🇫🇷//g' | sed 's/🇪🇸//g' | sed 's/🌏//g' | sed 's/🇻🇳//g' | sed 's/🇹🇷//g' | sed 's/🇷🇴//g' | sed 's/🇳🇱//g' | sed 's/🇮🇹//g' | sed 's/🇮🇩//g' | sed 's/丨//g'`
 if [ $net = "tcp" ]
     then
       method="GET"
     else
       method="ws"
 fi
 if [ -z $path ]
   then
   path="/"
 fi
 echo -e "addr=\"$add:$port\"
uuid=\"$uuid\"
alterId=$aid
security=\"auto\"
method=\"$method\"
type=\"$Type\"
path=\"$path\"
host=\"$host\"
DNS=\"119.29.29.29\"
" >  $curPath/v2节点/$name.$remark.ini
echo -e 'cd /data/v2/
project_name="${0##*/}"
name=`echo $project_name`
filename="${name%.*}"
sed -i "/file=/cfile=$filename" config.ini
echo -e "
- 节点成功更换"
' > $curPath/节点选择/$name.$remark.sh
done < vm
echo -e "${green}已获取节点信息${plain}"
rm -r vm
rm -r link
rm -f ${0%/*}/*.bak