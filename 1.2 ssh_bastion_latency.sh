BASTION="binh@192.168.40.134"
TARGET="binh2@10.10.10.10"
PASSWORD="12345678"

for i in {1..30}
do
  START=$(date +%s%3N)
  sshpass -p "$PASSWORD" ssh \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -J "$BASTION" "$TARGET" "exit" \
    >/dev/null 2>&1
  END=$(date +%s%3N)
  echo $((END - START))
  sleep 2
done


#chmod +x ssh_bastion_latency.sh
#./ssh_bastion_latency.sh > ssh_latency.csv
