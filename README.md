# Zaffron (Fedora - Dotfiles) - "Copy from my arch dotfiles, truncated down to bare bones"

##### This is configuration for setting up my fedor OS with proper config files on the go

## How to setup

- First copy the dotfiles on the base level of your home directory, for me it is `/home/zaffron`
- Then make sure you have installed `stow` using `yay -S stow`
- Once stow is installed and you have cloned the repo on your base directory go inside the `dotfiles` directory
- From inside the directory(open in command line) and run the following command `stow --adopt .`
- This should auto symlink all the config files


## Make sure following are installed

```bash
kitty
zsh
oh-my-zsh
starship
tmux
git
nvim
```

---

**Also make sure to check the font files on the different css files or you can just fuzzy search through them and install the fonts. I am not going to list the fonts here as I change them based on mood.**
