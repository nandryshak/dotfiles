mkdir %HOMEPATH%\.vim
mkdir %HOMEPATH%\.vim\bundle
mkdir %HOMEPATH%\.vim\CustomSnippets
mklink /H %HOMEPATH%\.vimrc %HOMEPATH%\GitHub\dotfiles\.vimrc
mklink /H %HOMEPATH%\.gvimrc %HOMEPATH%\GitHub\dotfiles\.gvimrc
mklink /H %HOMEPATH%\.vim\bundles.vim %HOMEPATH%\GitHub\dotfiles\.vim\bundles.vim
mklink /H %HOMEPATH%\.vim\CustomSnippets\html.snippets %HOMEPATH%\GitHub\dotfiles\.vim\CustomSnippets\html.snippets
