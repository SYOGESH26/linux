In this I explain about system-information.sh file.

1.How to view "cpu percentage" in system for that I use following command:

  top -bn1 | grep 'Cpu(s)' | awk '{print $8}'

  Terms
  
  * top=Real time display system processes.
  * -bn1=To run top command for one time.
  * grep 'Cpu(s)'=It shortlist Cpu line in top command.
  * awk '{print $8}'=advanced text processing tool to view line 8.

2.How to view RAM percentage in OS for that I use following commands:

  * used=$(free | grep 'Mem' | awk '{print $3}')
  * total=$(free | grep 'Mem' | awk '{print $2}')
  * percentage=$((used * 100 / total))

  * Generally free command displays RAM in kilobytes not in percentage that's why I use extra commands here.
  * percentage variable is used to calculate RAM in percentage.

3.Disk space in OS,command used :

   * df / | grep / | awk '{print $5}' | tr -d '%'

  Terms

  * df / = To show disk space for filesystem /.
  * tr -d '%'= To remove '%' in output.

4.Show Top 5 memory comsuming process,command used :

  * Ps aux --sort=%mem | head -n 5

  Terms

  * ps aux = Show all users running process.
  * --sort=%mem = sortlisted memory consuming process only.
  * head -n 5 = Show top 5 consuming process.

5.Monitor server load ,command used:

  * uptime | awk '{print $9,$10,$11}'

  Terms
 
  * uptime = Shows how many users logged, shows how long system running and finally average load.

6.Check network latency between two servers,commands used:

  tool=eth0
  rx1=$(cat /sys/class/net/$tool/statistics/rx_bytes) 
  tx1=$(cat /sys/class/net/$tool/statistics/tx_bytes) 
  sleep 1
  rx2=$(cat /sys/class/net/$tool/statistics/rx_bytes)
  tx2=$(cat /sys/class/net/$tool/statistics/tx_bytes)
  rxrate=$(( (rx1-rx2) / 1024))
  txrate=$(( (tx1-tx2) / 1024))
  
  Terms

  * rx1=$(cat /sys/class/net/$tool/statistics/rx_bytes) this command helped to view upload speed.
  * tx1=$(cat /sys/class/net/$tool/statistics/tx_bytes) this command helped to view download speed.
  * rxrate=$(( (rx1-rx2) / 1024)) this command calculate upload speed in megabytes.
  * txrate=$(( (tx1-tx2) / 1024)) this command calculate download speed in megabytes.

7.Shows which ports are open,command used:

  ss -tuln

  * ss -tuln is modern command to view open ports in OS.

8.Monitor zombie process,command used:

  top -bn1 | awk '{if($8=="Z")print}'

  * This command helped to view zombie process in the OS.
 
