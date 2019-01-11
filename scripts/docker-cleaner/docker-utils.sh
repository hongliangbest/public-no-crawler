#!/bin/bash

######
# docker 工具类型
######

# 移除所有容器
function docker_utils_rm_ctns(){
	local containerIds=$(docker ps -aq)
	if [ "$containerIds" != "" ]; then
		docker rm -f ${containerIds}
	fi
}

# 清理所有
function docker-utils-clear(){
	echo "————>" '清空所有容器'
	docker_utils_rm_ctns

	echo "————>" '清理无效容器券'
	./docker-utils-prune-volume.sh

	echo "————>" '清理无效网络'
	./docker-utils-prune-net.sh
}

docker-utils-clear
