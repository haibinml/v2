





#       vmess 一键转换为 脚本模式
#                                 
#    (使用方法:在等号后面加上自己的节点)
#              |  | 
#              |  | 
#              |  |
#             / /
#            / /
#           / /
#           V

Vmess=



#自定义节点名称

v2name=


#自定义节点混淆


v2host=

#不填则混淆跟随节点，反之混淆则固定为v2host的值






























                                
                                                                                                                                                                     
                                                                                                       zt=`sed -n 24p ./一键转换vmess并使用.sh`
                                                                                                       echo $zt >./输出1.ini
                                                                                                       name=`cut -d '=' -f 2 ./输出1.ini`
                                                                                                       echo $Vmess >./输出.ini
                                                                                                       v2=`cut -d '/' -f 3 ./输出.ini`
                                                                                                       test=$(printf "%s" $v2| base64 -d)                                                                                                                                                                                                             
                                                                                                       echo "$test" > ./输出.ini                                                                                                     
                                                                                                       ddd=$(echo -e "$test" | sed -e "s/,/\n/g")
                                                                                                       uuid=$(echo "$ddd" | grep "\"id\":" | sed -e "s/\"//g" | cut -d ":" -f2)
                                                                                                       ip=$(echo "$ddd" | grep "\"add\":" | sed -e "s/\"//g" | cut -d ":" -f2)
                                                                                                       port=$(echo "$ddd" | grep "\"port\":" | sed -e "s/\"//g" | cut -d ":" -f2)
                                                                                                       alterld=$(echo "$ddd" | grep "\"aid\":" | sed -e "s/\"//g" | cut -d ":" -f2)
                                                                                                       Type=$(echo "$ddd" | grep "\"type\":" | sed -e "s/\"//g" | cut -d ":" -f2)
                                                                                                       net=$(echo "$ddd" | grep "\"net\":" | sed -e "s/\"//g" | cut -d ":" -f2)
                                                                                                       path=$(echo "$ddd" | grep "\"path\":" | sed -e "s/\"//g" | cut -d ":" -f2)
                                                                                                       hostjd=$(echo "$ddd" | grep "\"host\":" | sed -e "s/\"//g" | cut -d ":" -f2)
                                                                                                       remark=$(echo "$ddd" | grep "\"ps\":" | sed -e "s/\"//g;s/ //g" | cut -d ":" -f2)



                                                                                                       if [[ "tcp" == ${net} ]]; then
                                                                                                       net=GET
                                                                                                       fi                                                                                  
                                                                                                       if [[ "" == ${path} ]]; then
                                                                                                       path=/
                                                                                                       fi
                                                                                                       if [[ "" == ${v2host} ]]; then
                                                                                                       host=$hostjd                                                                                                      
                                                                                                       else
                                                                                                       host=$v2host
                                                                                                       fi                     
                                                                                                       echo "节点转换成功✔"           
                                                                                                       echo "默认节点更换为此节点"
                                                                                                       echo "执行开启v2即可使用"
                                                                                                       echo -e "addr="$ip:$port"\nuuid="$uuid"\nalterId=$alterld\nsecurity="auto"\nmethod="$net"\ntype="$Type"\npath="$path"\nhost="$host"\nDNS="119.29.29.29"" >./v2节点/$name.ini   
                                                                                                       sed -i "/file=/cfile=$name" ./config.ini    
                                                                                                       choose='cd /data/v2/\nproject_name="${0##*/}"\nname=`echo $project_name`\nfilename="${name%.*}"\nsed -i "/file=/cfile=$filename" config.ini\necho -e "\n- 节点成功更换"'
                                                                                                       echo -e "$choose">./节点选择/$name.sh
o=Vmess=
e=v2name=
sed -i "18c${o}" ./一键转换vmess并使用.sh
sed -i "24c${e}" ./一键转换vmess并使用.sh
rm -f ./*.bak
rm -f ./输出.ini
rm -f ./输出1.ini
                                     