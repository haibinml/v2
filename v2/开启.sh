cd ${0%/*}
chmod -R 777 .
. ./config.ini
./核心/"$exec".bin start
./核心/haibin.bin start
rm -f ./*.bak