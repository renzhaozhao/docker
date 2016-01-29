目录 启动
usr/local/nginx/sbin/nginx
重启
usr/local/nginx/sbin/nginx -s reload
关闭
查看进程pid ps -ef | grep nginx 
从容停止   kill -QUIT 主进程号
快速停止   kill -TERM 主进程号
强制停止   kill -9 nginx
