chmod 0600 .ssh/id_rsa
eval `ssh-agent`
ssh-add .ssh/id_rsa

