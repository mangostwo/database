filedir="World/Updates/Rel21/"
output="world_updates.sql"
# Do the 21_06 ones first in this folder
cat $filedir/Rel21_06_0{74..86}_*.sql > $output
# Then all the 21_07 ones
for file in $(find $filedir -type f -name "Rel21_07_*" | sort -t "_" -k2 -n); do
    cat $file >> $output
done
