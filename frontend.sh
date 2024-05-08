source common.sh
rm -f /tmp/expense.log

Heading installing nginx
dnf install nginx -y &>>/tmp/expense.log
STAT $?

Heading copy the expense.config file
cp expense.config /etc/nginx/default.d/expense.config &>>/tmp/expense.log
STAT $?

Heading clean old content
rm -rf /usr/share/nginx/html/*  &>>/tmp/expense.log
STAT $?


Heading download frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>/tmp/expense.log
STAT $?
cd /usr/share/nginx/html

Heading extract the content
unzip /tmp/frontend.zip &>>/tmp/expense.log
STAT $?

Heading restart content
systemctl enable &>>/tmp/expense.log
systemctl restart nginx &>>/tmp/expense.log
STAT $?