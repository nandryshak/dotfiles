mkdir %USERPROFILE%\.vim
mkdir %USERPROFILE%\.vim\bundle
mkdir %USERPROFILE%\.vim\CustomSnippets
mklink /H %USERPROFILE%\.vimrc %USERPROFILE%\Documents\GitHub\dotfiles\.vimrc
mklink /H %USERPROFILE%\.gvimrc %USERPROFILE%\Documents\GitHub\dotfiles\.gvimrc
mklink /H %USERPROFILE%\.vim\bundles.vim %USERPROFILE%\Documents\GitHub\dotfiles\.vim\bundles.vim
mklink /H %USERPROFILE%\.vim\functions.vim %USERPROFILE%\Documents\GitHub\dotfiles\.vim\functions.vim
mklink /H %USERPROFILE%\.vim\CustomSnippets\html.snippets %USERPROFILE%\Documents\GitHub\dotfiles\.vim\CustomSnippets\html.snippets
