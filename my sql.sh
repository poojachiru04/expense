echo -e "\e[35minstalling mysql server \e[0m"
dnf install mysql-server -y

echo -e "\e[35mstart the nginx server \e[0m"
systemctl enable mysqld
systemctl start mysqld

echo -e "\e[35mset root password \e[0m"
mysql_secure_installation --set-root-pass ExpenseApp@1