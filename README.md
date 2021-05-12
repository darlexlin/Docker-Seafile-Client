

## 镜像内容

此镜像引用自：linuxserver/baseimage-ubuntu:bionic

## 参数设置

| 参数                | 说明                  |
| ------------------- | --------------------- |
| -e PUID=1000        | UserID                |
| -e PGID=100         | GroupID               |
| -e TZ=Asia/Shanghai | 默认时区Asia/Shanghai |
| -v /sf              | 数据文件目录          |
| -v /app             | 配置文件目录          |

## 使用方法

进入后台，可使用seaf-cli命令进行操作；

具体执行方法参照[官方方法](https://help.seafile.com/syncing_client/linux-cli/)