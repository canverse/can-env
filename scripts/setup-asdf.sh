echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing asdf for language version management$(tput sgr 0)"
echo "---------------------------------------------------------"
asdf_dir=$HOME/.asdf
asdf_tool_versions="${HOME}/.tool-versions"


NODE_VERSION="12.13.0"
PYTHON3_VERSION="3.8.0"
PYTHON2_VERSION="2.7.17"
RUBY_VERSION="2.6.5"

rm asdf_tool_versions # remove this later

echo "nodejs ${NODE_VERSION}" >> $asdf_tool_versions
echo "python ${PYTHON3_VERSION} ${PYTHON2_VERSION}" >> $asdf_tool_versions
echo "ruby ${RUBY_VERSION}" >> $asdf_tool_versions

if [ ! -d $asdf_dir ]; then
    echo "Installing asdf..."
    git clone https://github.com/asdf-vm/asdf.git $asdf_dir
    echo "asdf installation complete"
else
    echo "asdf already installed"
fi

asdf plugin-add python https://github.com/danhper/asdf-python.git || true
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git || true
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git || true

bash $asdf_dir/plugins/nodejs/bin/import-release-team-keyring || true

asdf install

