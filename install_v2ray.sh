#unzip v2ray-linux-64.zip

rm -rf ./temp
git clone https://github.com/zhangpengfic/v2ray_model -b "main" ./temp --depth=1

cd temp
mkdir -p /etc/v2ray /usr/bin/v2ray /var/log/v2ray # 创建目录
chmod +x v2ray v2ctl # 赋予可执行权限
cp -rf v2ray v2ctl geoip.dat geosite.dat -t /usr/bin/v2ray # 移动文件
cp -rf vpoint_vmess_freedom-try.json /etc/v2ray/config.json #仅创建配置文件
cp -rf systemd/v2ray.service /etc/systemd/system/ # 移动文件
systemctl enable v2ray # 用于程序开机启动并且崩溃时自动重启程序
systemctl restart v2ray
cd ..
