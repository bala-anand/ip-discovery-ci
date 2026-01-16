ip=$(hostname -I | awk '{print $1}')
 
echo "Local IP Address: $ip"
