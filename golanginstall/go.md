First we want to remove old versions of Go. Run the following command in WSL Ubuntu:

```bash
sudo rm -rf /usr/local/go* && sudo rm -rf /usr/local/go	
```
Then we want to download the latest version (currently 1.18). The commands for this are:

```bash
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
tar -xvf go1.22.0.linux-amd64.tar.gz
sudo mv go /usr/local
```
Next we need to add Go to our environment profile so that it can get picked up by our command line. Open ~/.bashrc with VS Code or your favorite editor: `code ~/.bashrc` or `vim ~/.zshrc` if you are using vim

Update the settings are per below:

```bash
export GOROOT=/usr/local/go-1.12
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
```

Restart your command line/terminal by ` source ~/.zshrc`
 and verify that the latest version has been installed correctly by typing go version.

Then 
```bash
go version
```