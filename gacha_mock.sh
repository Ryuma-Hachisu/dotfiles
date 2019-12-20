#/bin/sh

echo -n > ~/log.txt

#echo `curl -s -X POST http://localhost:8081/reset`
#sleep 2


echo "###############################"
echo "init処理(User, auth作成)"
echo "###############################"

#MASTER_DATA=`curl -s -X POST -H "Content-Type: application/json" -d "{\"branch_name\": \"master_gacha_v2\", \"commit_hash\": \"1698ed5eacbc4f015af6e34f917ed1db15325871\" }" https://api.gacha-v2.mb.xflag.com/master/import`

echo 'master_data   -> ' $MASTER_DATA

### xargsはクオートのtrim用
USER_JSON=`curl -s -X POST -H "Content-Type: application/json" -d "{\"name\":\"test_user\"}" https://api.gacha-v2.mb.xflag.com/user/signup`
USER_UUID=`echo ${USER_JSON} | jq '.user.uuid' | xargs`
USER_ID=`echo ${USER_JSON} | jq '.user.id' | xargs`

#echo 'user   -> ' $USER_JSON


USER_AUTH=`curl -s -X POST -H "Content-Type: application/json" -d "{\"uuid\": \"${USER_UUID}\" }" https://api.gacha-v2.mb.xflag.com/user/login | jq '.authorization' | xargs`
USER_DATA=`curl -s -X POST -H "Content-Type: application/json" -H "authorization:${USER_AUTH}" https://api.gacha-v2.mb.xflag.com/user/get_data | jq .`

#USER_CHARA_ID=`echo ${USER_DATA} | jq '.user_full_data.user_characters[0].id' | xargs`

echo 'request: ' `curl -s -X POST -H "authorization:${USER_AUTH}" -d "{}" https://api.gacha-v2.mb.xflag.com/gacha/info`
echo 'request: ' `curl -s -X POST -H "authorization:${USER_AUTH}" -d "{\"gacha_event_id\": \"1\",\"gacha_select_id\": \"1\", \"gacha_select_type\": \"STORE\"}" https://api.gacha-v2.mb.xflag.com/gacha/pull`
#echo 'request: ' `curl -s -X POST -H "authorization:${USER_AUTH}" -d "{\"gacha_event_id\": \"1\",\"gacha_select_type\": \"1\"}" https://api.gacha-v2.mb.xflag.com/gacha/pull`


