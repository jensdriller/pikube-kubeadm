# ssh to host. change password (way to avoid this?)

USER=$1
DEST_IP_ADDR=$2

# copy public ssh key to destintation
ssh-copy-id $USER@$DEST_IP_ADDR

# Add ssh public key for root ssh access
cat ~/.ssh/id_rsa.pub | \
  ssh $USER@$DEST_IP_ADDR \
  "sudo mkdir -p /root/.ssh; sudo tee -a /root/.ssh/authorized_keys"

