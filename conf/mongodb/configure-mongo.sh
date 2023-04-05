#!/bin/sh

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

touch /data/db/.configured

####icons
mkdir /tmp/${APPLICATION_DATABASE}
cp /docker-entrypoint-initdb.d/assets/icons.bson.gz /tmp/${APPLICATION_DATABASE}/
FILE_DUMP="icons.bson.gz"
PARAM_DB="--authenticationDatabase $APPLICATION_DATABASE -u $APPLICATION_USER -p $APPLICATION_PASS --gzip /tmp/${APPLICATION_DATABASE}/${FILE_DUMP}"
mongorestore ${PARAM_DB}
rm -rf mkdir /tmp/${APPLICATION_DATABASE}
####
echo "Mongo ready for use"