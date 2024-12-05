#!/bin/bash
ADDRESS="amazon.de"
max_ping_time_ms=10
max_count=3
count=0
while true;
 do
 ping_result=$(ping -c 1 "$ADDRESS" | grep 'icmp_seq')
 ping_time=$(echo "$ping_result" | awk -F'=' '{print $4}' | awk -F'.' '{print $1}')
 if [ -n "$ping_time" ] && [ "$ping_time" -gt "$max_ping_time_ms" ]; then
 echo "Ping  $ADDRESS previshaet $max_ping_time_ms ms: $ping_time ms."
 fi
 if [ -z "$ping_time" ]; then
 echo "Ping  $target_address ne ydalsya."
 ((failures++))
 else
 echo "ping  $target_address yspeshno: $ping_time ms."
 failures=0
 fi
 if [ "$count" -ge "$max_count" ]; then
 echo "Previsheno maximalnoe kolichestvo popytok"
 failures=0
 fi
 sleep 1
 done
