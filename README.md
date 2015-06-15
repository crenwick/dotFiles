# v2.2

#### Installing BashRc

Link the git-prompt file:
```sh
$ ln -s `pwd`/BashAndVim/dotGit-prompt.sh ~/.git-prompt.sh
```

Link the bash_profile:
```sh
ln -s `pwd`/BashAndVim/dotBash_profile ~/.bash_profile
```

---

#### Installing Vim

Modeled closely after [VimBox](https://github.com/jordwalke/VimBox).

Install MacVim:
```sh
brew install macvim --with-cscope --python --HEAD
brew linkapps   # Put the app in your /Applications directory
```

Link the files:
```sh
ln -s `pwd`/BashAndVim/dotVim ~/.vim      # Link to the cloned vim config
ln -s `pwd`/BashAndVim/dotVimRc ~/.vimrc
ln -s `pwd`/BashAndVim/dotGVimRc ~/.gvimrc
```

Start `MacVim`, install the bundles, and restart `MacVim`

Install the `vim-airline` font

Make your MacVim use the VimBox icon (optional)
