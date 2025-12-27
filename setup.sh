
set -e 
git clone https://github.com/vim/vim.git
cd vim/src
make install

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
bash -c "nvm install 22 && nvm use 22"
