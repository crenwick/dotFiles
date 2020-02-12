if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# opam configuration
test -r /Users/crenwick/.opam/opam-init/init.sh && . /Users/crenwick/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="$HOME/.cargo/bin:$PATH"
