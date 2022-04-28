#unzip v2ray-linux-64.zip

#caddy
#curl -sS https://webinstall.dev/caddy | bash
rm -rf ~/Caddyfile
touch ~/Caddyfile
mkdir -p /www/wwwroot/caddy
rm -rf /www/wwwroot/caddy/index.html
touch /www/wwwroot/caddy/index.html
echo $1' {'>>~/Caddyfile
echo '   root * /www/wwwroot/caddy'>>~/Caddyfile
echo '   reverse_proxy /zp localhost:56331'>>~/Caddyfile
echo '   file_server'>>~/Caddyfile
echo '}'>>~/Caddyfile


#运行
systemctl stop nginx #服务器使用nginx才用
caddy run
