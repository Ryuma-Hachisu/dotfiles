#/bin/sh

echo -n > ~/log.txt

#echo `curl -s -X POST http://localhost:8081/reset`
#sleep 2


echo "###############################"
echo "init処理(User, auth作成)"
echo "###############################"

#MASTER_DATA=`curl -s -X POST -H "Content-Type: application/json" -d "{\"branch_name\": \"enhance\", \"commit_hash\": \"727affaeb0a9e24ebec47dfbfa4f6764d208a78b\" }" http://localhost:8080/master/import`
#echo 'master_data   -> ' $MASTER_DATA

### xargsはクオートのtrim用
USER_JSON=`curl -s -X POST -H "Content-Type: application/json" -d "{\"name\":\"test_user\"}" http://localhost:8080/user/signup`
USER_UUID=`echo ${USER_JSON} | jq '.user.uuid' | xargs`
USER_ID=`echo ${USER_JSON} | jq '.user.id' | xargs`

echo 'user   -> ' $USER_JSON

USER_AUTH=`curl -s -X POST -H "Content-Type: application/json" -d "{\"uuid\": \"${USER_UUID}\" }" http://localhost:8080/user/login | jq '.authorization' | xargs`
USER_DATA=`curl -s -X POST -H "Content-Type: application/json" -H "authorization:${USER_AUTH}" http://localhost:8080/user/get_data | jq .`

USER_CHARA_ID=`echo ${USER_DATA} | jq '.user_full_data.user_characters[0].id' | xargs`

STICKER_ID=1

USER_CHARA_ID_STICKER_ID=`echo ${USER_DATA} | jq '.user_full_data.user_characters[0].user_character_stickers[0].id' | xargs`
USER_CHARA_ID_SUB_STICKER_ID=`echo ${USER_DATA} | jq '.user_full_data.user_characters[0].user_character_stickers[0].sub_stickers[0].id' | xargs`

echo 'user_data   -> ' $USER_DATA
echo 'user_chara_id   -> ' $USER_CHARA_ID
echo 'user_chara_sticker_id   -> ' $USER_CHARA_ID_STICKER_ID
echo 'user_chara_sticker_sub_id -> ' $USER_CHARA_ID_SUB_STICKER_ID

echo 'request: ' 


API=`curl -s -X POST -H "authorization:${USER_AUTH}" -d "{\"user_character_id\": ${USER_CHARA_ID}, \"user_character_sticker_id\": ${USER_CHARA_ID_STICKER_ID}}" http://localhost:8080/user_character/unlock_main_slot`
echo 'unlock_main_slot api   -> ' $API

API=`curl -s -X POST -H "authorization:${USER_AUTH}" -d "{\"user_character_id\": ${USER_CHARA_ID}, \"sticker_id\" : 1, \"user_character_sticker_id\": ${USER_CHARA_ID_STICKER_ID} }" http://localhost:8080/user_character/set_main_sticker`
echo 'set_main_sticker api   -> ' $API

API=`curl -s -X POST -H "authorization:${USER_AUTH}" -d "{\"user_character_id\": ${USER_CHARA_ID}, \"user_sticker_object_id\": ${USER_CHARA_ID_SUB_STICKER_ID}}" http://localhost:8080/user_character/unlock_sub_slot`
echo 'unlock_sub_slot api   -> ' $API

API=`curl -s -X POST -H "authorization:${USER_AUTH}" -d "{\"user_character_id\": ${USER_CHARA_ID}, \"user_sticker_object_id\": ${USER_CHARA_ID_SUB_STICKER_ID} }" http://localhost:8080/user_character/set_sub_sticker`
echo 'set_sub_sticker api   -> ' $API

API=`curl -s -X POST -H "authorization:${USER_AUTH}" -d "{\"user_character_id\": ${USER_CHARA_ID}, \"sticker_id\" : 3, \"user_sticker_object_id\": ${USER_CHARA_ID_SUB_STICKER_ID} }" http://localhost:8080/user_character/cancel_sub_sticker`
echo 'cancel_sub_sticker api   -> ' $API


