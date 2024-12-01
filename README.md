# Hometask #7 (17/10)

## How to Use in Putty
0. run instance:
    - chmod +x create_instance.sh
    - ./create_instance.sh {KEY_NAME} {SECURITY_GROUP_ID} {SUBNET_ID} {IAM_PROFILE_NAME}

1. delete instance:
    - chmod +x delete_instance.sh
    - ./delete_instance.sh {instance-id} 

## run SSH

### Dynamic Port Forwarding (-D) (SOCKS5) (p:1080)
```bash
ssh -i /Users/illasokolov/Desktop/pem_kp1_ex2.pem -D 1080 ubuntu@3.95.212.10
```
- test ip: 2ip.ua

### Reverse Port Forwarding -R
- Amazon AWS -> Security > Security groups > Edit inbound rules > add port 8000 (any-ipv4)
```bash
ssh -i /Users/illasokolov/Desktop/pem_kp1_ex2.pem -R 8000:localhost:8000 ubuntu@3.95.212.10
```
http://3.95.212.10:8000