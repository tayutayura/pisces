log_file=/var/log/mysqld.log
tmp_password=$(sudo grep 'password is generated' $log_file | awk -F 'root@localhost: ' '{print $2}')

tmp_file=/root/tmp.my.cnf
umask 0077
cat > $tmp_file <<EOF
[client]
user=root
password=$tmp_password
connect-expired-password
EOF
