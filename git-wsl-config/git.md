
### Install git in wsl
```bash
sudo apt update && sudo apt install git -y
```


### Configure git
```bash
git config --global user.name "drsimplegraffiti"
git config --global user.email "abayomiogunnusi@gmail.com"
```


### add the ssh
```bash
ssh-keygen -t rsa -b 4096 -C "abayomiogunnusi@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

```

### Copy the ssh to Github
```bash
cat ~/.ssh/id_rsa.pub | clip.exe
```

### Then check
```bash
ssh -T git@github.com
```

### incase of any error
```bash

sudo chmod -R 755 .
sudo chown -R $(whoami) .
wsl --shutdown
wsl
```
