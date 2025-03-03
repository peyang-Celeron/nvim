local config = require("lspconfig").jdtls.document_config

require("lspconfig/configs").jdtls = nil

require("lspinstall/servers").jdtls = vim.tbl_extend('error', config, {
  install_script = [[
    rm -rf eclipse.jdt.ls
    git clone https://github.com/eclipse/eclipse.jdt.ls.git
    cd eclipse.jdt.ls
    ./mvnw clean verify -DskipTests
  ]]
})

require("lspinstall/servers").eslintd = vim.tbl_extend("error", {}, {
  install_script = [[
    ! test -f package.json && npm init -y --scope=lspinstall || true
    npm install eslint_d@latest
  ]]
})

local clangd_config = require("lspinstall/util").extract_config("clangd")

require("lspinstall/servers").cpp = vim.tbl_extend('error', clangd_config, {
  install_script = [[
    os=$(uname -s | tr "[:upper:]" "[:lower:]")
    
    case $os in
      linux)
        platform="linux"
        ;;
      darwin)
        platform="mac"
        ;;
    esac

    curl -Lo clangd.zip $(curl -s "https://api.github.com/repos/clangd/clangd/releases/latest" | jq . | grep -E "https?://.*\.zip" | cut -d\" -f4 | grep "clangd-$platform")
    unzip clangd.zip
    rm clangd.zip
    mv clangd_* clangd
  ]]
})

require("lspinstall/servers").emmet = vim.tbl_extend('error', {}, {
  install_script = [[
    ! test -f package.json && npm init -y --scope=lspinstall || true
    npm install emmet-ls@latest
  ]]
})

require'lspinstall'.setup()

