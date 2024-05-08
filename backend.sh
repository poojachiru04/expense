source common.sh
rm -f /tmp/expense.log

Heading "Disable nodejs default version "
dnf module disable nodejs -y &>>/tmp/expense.log
STAT $?

Heading "Enable nodejs 20"
dnf module enable nodejs:20 -y  &>>/tmp/expense.log
STAT $?

Heading "Install nodejs"
dnf install nodejs -y  &>>/tmp/expense.log
STAT $?

Heading "Add expense user"
id expense  &>>/tmp/expense.log
if [ $? -ne 0 ]; then
  useradd expense  &>>/tmp/expense.log
fi
STAT $?

Heading "Setup backend service"
cp backend.service /etc/systemd/system/backend.service  &>>/tmp/expense.log
STAT $?

Heading "Delete existing Application Directory "
rm -rf /app
STAT $?

Heading "Create Application Directory"
mkdir /app  &>>/tmp/expense.log
STAT $?

Heading "Download backend code"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip  &>>/tmp/expense.log
STAT $?

cd /app

Heading " Extract backend code"
unzip /tmp/backend.zip  &>>/tmp/expense.log
STAT $?

Heading "Download nodejs app dependencies"
npm install  &>>/tmp/expense.log
STAT $?

Heading "install mysql client"
dnf install mysql -y  &>>/tmp/expense.log
STAT $?

Heading " load schema"
mysql -h 18.212.87.228 -uroot -p$1 < /app/schema/backend.sql  &>>/tmp/expense.log
STAT $?

Heading "Start backend service"
systemctl daemon-reload
systemctl enable backend
systemctl restart backend
STAT $?