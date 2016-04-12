# Bob Lail's dotfiles

### Installing

```
git clone git@github.com:boblail/dotfiles.git ./Me
cd Me/src/vcprompt-07f110976599 && make && cd -
```

Add `. ~/Me/bashrc` to `~/.bashrc`
Add `. ~/Me/bash_profile` to `~/.profile`

Open iTerm's Preferences, and select **Load preferences from a custom folder or URL** and fill in `~/Me/iterm2`

##### Atom Theme

To make the Solarcasts Theme available in Atom, do:

```
apm link ~/Me/atom/solarcasts-theme-syntax
```
