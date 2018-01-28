# new_password='Asdf1234@'
while getopts p: OPT
do
  case $OPT in
    p) new_password="$OPTARG";;
  esac
done

mysql --defaults-file=/root/tmp.my.cnf -e "ALTER USER 'root'@'localhost' IDENTIFIED BY  '$new_password'"

tmp_file=/root/my.cnf
umask 0077
cat > $tmp_file <<EOF
[client]
user=root
password=$new_password
EOF
