#!/bin/bash

CMD=$1

if [ "$CMD" = "" ];then
  CMD=add
fi

# add alias
if [ "$CMD" = "" -o "$CMD" = "add" ];then
  ifconfig lo0 alias 10.254.254.254
  cp alias_wf.plist /Library/LaunchDaemons/jp.kazylla.docker.alias_wf.plist
fi

# remove alias
if [ "$CMD" = "del" ];then
  ifconfig lo0 -alias 10.254.254.254
  rm /Library/LaunchDaemons/jp.kazylla.docker.alias_wf.plist
fi
