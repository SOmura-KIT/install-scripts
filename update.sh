SCRIPT_PATH="$(realpath "$0")"
BASE_DIR="$(dirname "$SCRIPT_PATH")"

function update_neovim() {
  cd "$BASE_DIR/neovim"
  git pull
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/.local/nvim BUNDLED_CMAKE_FLAG='-DUSE_BUNDLED_TS_PARSERS=OFF' -j8
  make install
}

update_neovim
