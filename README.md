# v2.1

#### Installing BashRc

1. Link the git-prompt file
```sh
ln -s `pwd`/BashAndVim/dotGit-prompt.sh ~/.git-prompt.sh
```

2. Link the bash_profile
```sh
ln -s `pwd`/BashAndVim/dotBash_profile ~/.bash_profile
```

---

#### Installing Vim

Modeled closely after [VimBox](https://github.com/jordwalke/VimBox).

1. Install MacVim:
```sh
brew install macvim --with-cscope --python --HEAD
brew linkapps   # Put the app in your /Applications directory
```

2. Link the files
```sh
ln -s `pwd`/BashAndVim/dotVim ~/.vim      # Link to the cloned vim config
ln -s `pwd`/BashAndVim/dotVimRc ~/.vimrc
ln -s `pwd`/BashAndVim/dotGVimRc ~/.gvimrc
```

3. Start `MacVim`, install the bundles, and restart `MacVim`

4. Install the `vim-airline` font

5. Make your MacVim use the VimBox icon (optional)
