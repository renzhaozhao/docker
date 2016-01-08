#创建一个ubuntu的虚拟机，退出后删除本虚拟机
```
docker run -it --rm ubuntu:14.04 /bin/bash
```

#创建一个ubuntu的虚拟机，并挂载一个文件夹，退出后删除本虚拟机
```
docker run -it -v /c/Users/hzlzjr/:/hz/  --rm ubuntu:14.04 /bin/bash
```

#创建一个名字为ubuntu的ubuntu系统虚拟机
```
docker run -it --name ubuntu ubuntu:14.04 /bin/bash
```

#查看所有虚拟机和状态
```
docker ps -a
```

#查看运行的虚拟机
```
docker ps -a
```

#开启虚拟机
```
docker start ubuntu
```

#进入虚拟机
```
docker exec -it ubuntu /bin/zsh
```

##剩下的就 为所欲为吧


#安装oh my zsh
```
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```


docker换git bash
* "D:\Program Files\Git\git-bash.exe" "D:\Program Files\Docker Toolbox\start.sh"


##ps
在docker default的bin目录下创建可执行文件
```
docker exec -it ubuntu /bin/zsh
ls -l #2进制换10进制，出来777
chmod 777 文件名
```
