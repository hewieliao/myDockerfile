#!/bin/bash
#检查11211端口
function check(){
	  #PRONUM=`lsof -i:11211|wc -l`
	    PRONUM=`ps -aux|grep memcached |wc -l`
	      if [ $PRONUM -eq 1 ];then
		          #/usr/bin/memcached -u memcached -p 11211 -m 64 -c 1024 &
			      systemctl start memcached
			        else
					    echo "not bad" > /dev/null
					      fi
				      }
			      for ((;;))
			      do
				        check
					  sleep 1
				  done
