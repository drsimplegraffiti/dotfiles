Run the following command in your WSL terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
```
🔹 If a new version of nvm is available, replace v0.39.4 with the latest version.

### Restart Shell
```bash
exec bash
```

### for Zsh users:

```bash
exec zsh
```

### Verify NVM Installation
```bash
command -v nvm
It should return nvm, confirming the installation.
```

### Install Node.js
To install the latest Node.js:
```bash
nvm install node
To install a specific version (e.g., 18):
```

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/3ntilwz2pmq4k9mkec2r.png)



```bash
nvm install 18
```

### Default Node Version
```bash
nvm use 18
nvm alias default 18
```

### Verify Installation
```bash
node -v
npm -v
```