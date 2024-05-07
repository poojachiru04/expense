echo -e "\e[35minstalling nginx \e[0m"
dnf install nginx -y
echo exit status -0

echo -e "\e[35mcopy the expense.config file \e[0m"
cp expense.config /etc/nginx/default.d/expense.conf
echo exit status -0

echo -e "\e[35mclean old content \e[0m"
rm -rf /usr/share/nginx/html/*echo
exit status -0


echo -e "\e[35mdownload frontend content \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/htmlecho
exit status -0


echo -e "\e[35mextract the content \e[0m"
unzip /tmp/frontend.zip
echo exit status -0

echo -e "\e[35mrestart content \e[0m"
systemctl enable
systemctl start nginx
systemctl restart nginx
echo exit status -0