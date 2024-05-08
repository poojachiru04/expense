source common.sh
rm -f /temp/expense.log

Heading installing nginx
dnf install nginx -y &>>/temp/expense.log
STAT $?

Heading copy the expense.config file
cp expense.config /etc/nginx/default.d/expense.conf &>>/temp/expense.lognf
STAT $?

Heading clean old content
rm -rf /usr/share/nginx/html/*  &>>/temp/expense.log
STAT $?


Heading download frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>/temp/expense.log
STAT $?
cd /usr/share/nginx/htmlecho

Heading extract the content
unzip /tmp/frontend.zip. &>>/temp/expense.log
STAT $?

Heading restart content
systemctl enable &>>/temp/expense.log
systemctl restart nginx &>>/temp/expense.log
STAT $?