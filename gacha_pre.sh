#/bin/sh

echo -n > ~/log.txt

#echo `curl -s -X POST http://localhost:8081/reset`
#sleep 2


echo "###############################"
echo "init処理(User, auth作成)"
echo "###############################"

### xargsはクオートのtrim用
USER_JSON=`curl -s -X POST -H "Content-Type: application/json" -d "{\"name\":\"test_user\",\"constellation\": \"1\"}" https://api.sticker.mb.xflag.com/user/signup`

echo 'user   -> ' $USER_JSON

USER_UUID=`echo ${USER_JSON} | jq '.user.uuid' | xargs`
USER_ID=`echo ${USER_JSON} | jq '.user.id' | xargs`



USER_AUTH=`curl -s -X POST -H "Content-Type: application/json" -d "{\"uuid\": \"${USER_UUID}\" }" https://api.sticker.mb.xflag.com/user/login | jq '.authorization' | xargs`
USER_DATA=`curl -s -X POST -H "Content-Type: application/json" -H "authorization:${USER_AUTH}" https://api.sticker.mb.xflag.com/user/get_data | jq .`

USER_CHARA_ID=`echo ${USER_DATA} | jq '.user_full_data.user_characters[0].id' | xargs`

echo 'user   -> ' $USER_AUTH
echo 'user_data   -> ' $USER_DATA

#echo 'request: ' `curl -s -X POST -H "Content-Type: application/json" -H "authorization:$USER_AUTH" -d "{}" https://api.sticker.mb.xflag.com/gacha/info`
echo 'request: ' `curl -s -X POST -H "Content-Type: application/json" -H "authorization:$USER_AUTH" -d "{\"gacha_group_id\": \"3\"}" https://api.sticker.mb.xflag.com/gacha/pull`
#echo 'request: ' `curl -s -X POST -H "Content-Type: application/json" -H "authorization:$USER_AUTH" -d "{\"gacha_group_id\": \"1\"}" https://api.sticker.mb.xflag.com/gacha/pull`
