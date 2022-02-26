When deploying the VM with vagrant, during provisionning if you receive this message :
"The following signatures couldn't be verified because the public key is not available: NO_PUBKEY KEY_TO_INSTALL
Just change the line #5 with the key needed to verify: sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys KEY_TO_INSTALL