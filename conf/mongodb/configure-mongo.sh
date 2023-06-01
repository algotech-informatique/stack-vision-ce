#!/bin/sh
#set -x
# ADMIN user
ADMIN_USER_MONGO=${ADMIN_USER:-"admin"}
ADMIN_PASS_MONGO=${ADMIN_PASS:-"admin"}

# Create the admin user
echo "Creating ADMIN user for Mongo..."
mongo admin << EOF
db.createUser({user: '$ADMIN_USER_MONGO', pwd: '$ADMIN_PASS_MONGO', roles:[{role:'root',db:'admin'}], passwordDigestor : 'server'});
EOF

mongo admin -u ${ADMIN_USER} -p ${ADMIN_PASS} << EOF
use $APPLICATION_DATABASE
db.createUser({user: '$APPLICATION_USER', pwd: '$APPLICATION_PASS', roles:[{role:'dbOwner', db:'$APPLICATION_DATABASE'}], passwordDigestor : 'server'})
EOF

####icons
TMP_DIR="/tmp/${APPLICATION_DATABASE}"
mkdir ${TMP_DIR}
cp /docker-entrypoint-initdb.d/assets/* ${TMP_DIR}/
cd ${TMP_DIR}/
FILE_DUMP=($(ls *.bson.gz))
for f in ${FILE_DUMP[@]}; do
PARAM_DB="--authenticationDatabase $APPLICATION_DATABASE -u $APPLICATION_USER -p $APPLICATION_PASS --gzip ${TMP_DIR}/$f"
mongorestore ${PARAM_DB}
done
rm -rf mkdir ${TMP_DIR}
####
echo "Mongo ready for use"

touch /data/db/.configured