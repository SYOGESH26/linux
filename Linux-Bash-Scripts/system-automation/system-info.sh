#CPU usage monitor
echo "cpu usage monitor"
cpu=$(top -bn1 | grep 'Cpu(s)' | awk '{print 100 - $8}') #This command is used to check cpu in percentage
echo "cpu :$cpu"

#RAM usage in percentage

echo "RAM usage in percentage"
used=$(free | grep 'Mem' | awk '{print $3}') #This command is used to view "used" RAM.
total=$(free | grep 'Mem' | awk '{print $2}') #This command is used to vire "Total" RAM.
percentage=$((used * 100 / total)) #This command is used to calculate in RAM used in percentage.
echo "RAM used percentage : $percentage"

#disk space analyzer.

echo "disk space "
dish=$(df / | grep / | awk '{print $5}' | tr -d '%') #This command is used to view consuming disk space in percentage.
echo "consuming disk space in percentage :$disk"

#Show top 5 memory consuming process.

echo "Show top 5 memory consuming process"
ps aux --sort=%mem | head -n 5 #This command is shortlist top 5memory consuming process.

#Monitor server load average.

load=$(uptime | awk '{print $9,$10,$11}') #This command is used to view load average.
echo "load:$load"

#Check Network latency between servers.
tool=eth0
rx1=$(cat /sys/class/net/$tool/statistics/rx_bytes) #This command is used to view upload speed.
tx1=$(cat /sys/class/net/$tool/statistics/tx_bytes) #This command is used to view download speed.
sleep 1
rx2=$(cat /sys/class/net/$tool/statistics/rx_bytes)
tx2=$(cat /sys/class/net/$tool/statistics/tx_bytes)
rxrate=$(( (rx1-rx2) / 1024))
txrate=$(( (tx1-tx2) / 1024))
echo "upload speed : $rxrate"
echo "download speed : $txrate"

#Show open ports and services.
echo "show open ports"
ss -tuln

#Monitor zombie process.

echo "zombie process"
top -bn1 | awk '{if($8=="Z")print}'
