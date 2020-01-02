echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing Python NeoVim client.$(tput sgr 0)"
echo "---------------------------------------------------------"
pip3 install neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing Python NeoVim client.$(tput sgr 0)"
echo "---------------------------------------------------------"
pip3 install pynvim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing node neovim package$(tput sgr 0)"
echo "---------------------------------------------------------"
yarn global add neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing vim linter (vint)$(tput sgr 0)"
echo "---------------------------------------------------------"
pip3 install vim-vint

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing bash language server$(tput sgr 0)"
echo "---------------------------------------------------------"
yarn global add bash-language-server

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing JS/TS language server$(tput sgr 0)"
echo "---------------------------------------------------------"
yarn global add javascript-typescript-langserver

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing Vue language server$(tput sgr 0)"
echo "---------------------------------------------------------"
yarn global add vue-language-server

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing vtop.$(tput sgr 0)"
echo "---------------------------------------------------------"
yarn global add vtop

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing typescript.$(tput sgr 0)"
echo "---------------------------------------------------------"
yarn global add typescript
echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing colorls.$(tput sgr 0)"
echo "---------------------------------------------------------"
gem install colorls

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing serve.$(tput sgr 0)"
echo "---------------------------------------------------------"
yarn global add serve
