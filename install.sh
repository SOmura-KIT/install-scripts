SCRIPT_PATH="$(realpath "$0")"
BASE_DIR="$(dirname "$SCRIPT_PATH")"

function install_neovim() {
  if [ -d "$BASE_DIR/neovim" ]; then
    return
  fi
  cd "$BASE_DIR"
  git clone https://github.com/neovim/neovim $BASE_DIR/neovim
  cd "$BASE_DIR/neovim"
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/.local/nvim BUNDLED_CMAKE_FLAG='-DUSE_BUNDLED_TS_PARSERS=OFF' -j8
  make install
}

install_neovim
