# Zaffron (Dotfiles) - "I use Arch, BTW! LOL"

##### This is configuration for setting up my arch OS with proper config files on the go

## How to setup

- First copy the dotfiles on the base level of your home directory, for me it is `/home/zaffron`
- Then make sure you have installed `stow` using `yay -S stow`
- Once stow is installed and you have cloned the repo on your base directory go inside the `dotfiles` directory
- From inside the directory(open in command line) and run the following command `stow --adopt .`
- This should auto symlink all the config files

## For basic setup I have used the following repo, though it is very old repo and might not work as of now

[Jakoolit](https://github.com/JaKooLit/Arch-Hyprland)

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
