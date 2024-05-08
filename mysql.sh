source common.sh
rf -f /tmp/expense.log

if [ -z "$1" ]; then
  echo "Input mysql password is missing"
  exit 1
fi

Heading Installing mysql server
dnf install mysql-server -y &>>/tmp/expense.log
STAT $?

Heading start the nginx server
systemctl enable mysqld &>>/tmp/expense.log
systemctl start mysqld &>>/tmp/expense.log
STAT $?

Heading set root password
mysql_secure_installation --set-root-pass $1 &>>/tmp/expense.log
STAT $?