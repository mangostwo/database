#!/usr/bin/env bash

command -v docker-compose || (echo "Docker compose is required for this script." && exit 1);

# Run MySQL command as root
root_command() {
    _cmd="${1:-SHOW DATABASES}";
    _db="${2:-}";

    docker-compose run --rm -e "MYSQL_CMD=${_cmd}" -e "MYSQL_USER=root" -e "MYSQL_PWD=MangosDb" -e "MYSQL_DB=${_db}" db_exec;
}

# Run MySQL command as the user
user_command() {
    _cmd="${1:-SHOW DATABASES}";
    _db="${2:-}";

    docker-compose run --rm -e "MYSQL_CMD=${_cmd}" -e "MYSQL_DB=${_db}" db_exec;    
}

export -f root_command;
export -f user_command;

###########################
##### Database server #####
###########################
docker-compose up -d db

output="ERROR";

while [ "$( echo ${output} | grep -io error)" == "ERROR" ];
do
  echo "Waiting for DB to come up.";
  sleep 2;
  output=$( root_command );
done

#########################
##### Database user #####
#########################
if docker-compose run --rm -e "MYSQL_CMD=SHOW DATABASES" -e "MYSQL_DB=" db_exec;
then
    echo "User connection successful."
else
    echo "Creating database user"

    root_command "SOURCE /opt/mangos2/database/user.sql" "";
    root_command "FLUSH PRIVILEGES" ""
fi

###########################
##### Realmd Database #####
###########################
root_command "SOURCE /opt/mangos2/database/Realm/Setup/realmdCreateDB.sql" "";
root_command "SOURCE /opt/mangos2/database/Realm/Setup/realmdLoadDB.sql" "realmd"

# find Realm/Updates/Rel21 -maxdepth 1 -iname '*.sql' -exec \
#     docker-compose run --rm -e "MYSQL_CMD=SOURCE {}" -e "MYSQL_DB=realmd" db_exec \;

find Realm/Updates/Rel21 -maxdepth 1 -iname '*.sql' -exec bash -c "root_command \"SOURCE {}\" \"realmd\"" \;

##############################
##### Character Database #####
##############################
root_command "SOURCE /opt/mangos2/database/Character/Setup/characterCreateDB.sql" ""
user_command "SOURCE /opt/mangos2/database/Character/Setup/characterLoadDB.sql" "character2"

# find Character/Updates/Rel21 -maxdepth 1 -iname '*.sql' -exec \
#     docker-compose run --rm -e "MYSQL_CMD=SOURCE {}" -e "MYSQL_DB=character2" db_exec \;

find Character/Updates/Rel21 -maxdepth 1 -iname '*.sql' -exec bash -c "root_command \"SOURCE {}\" \"character2\"" \;

##########################
##### World Database #####
##########################
root_command "SOURCE /opt/mangos2/database/World/Setup/mangosdCreateDB.sql" ""
user_command "SOURCE /opt/mangos2/database/World/Setup/mangosdLoadDB.sql" "mangos2"

find World/Setup/FullDB -maxdepth 1 -iname '*.sql' -exec bash -c "root_command \"SOURCE {}\" \"mangos2\"" \;

find World/Updates/Rel21 -maxdepth 1 -iname '*.sql' -exec bash -c "root_command \"SOURCE {}\" \"mangos2\"" \;

# find World/Setup/FullDB -maxdepth 1 -iname '*.sql' -exec \
#     docker-compose run --rm -e "MYSQL_CMD=SOURCE {}" -e "MYSQL_DB=mangos2" db_exec \;

# find World/Updates/Rel21 -maxdepth 1 -iname '*.sql' -exec \
#     docker-compose run --rm -e "MYSQL_CMD=SOURCE {}" -e "MYSQL_DB=mangos2" db_exec \;
