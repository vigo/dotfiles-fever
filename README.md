![Version](https://img.shields.io/badge/version-1.0.0-orange.svg)
![Version](https://img.shields.io/badge/platform-macOS | ubuntu | gentoo-yellow.svg)

# Dotfiles “Fever”

My custom **BASH** environment. Supports **macOS**, **Ubuntu** and **Gentoo**. 
Feel free to fork and PR. Enjoy!

---

## Features

![Example screen of PS1_ADVANCED](screens/screen_ps_advanced.png "Screenshot of PS1_ADVANCED")

**Common features**:

* Enhanced `history`, formatted output, continuous history across terminal tabs.
* Auto included `PATH` information. `~/bin`, `/usr/local/sbin` and more.
* Auto load for `rbenv`, `pyenv`, `pip`
* Special prompts: **git**, **hg**, **ip_list**, **rbenv**, **pyenv**, **django**, **virtualenv**
* Bash completions: `bundler`, `django-admin`, `manage.py`, `gem`, `hg`, `rake`, `printev`, `pip`
* Nice `rc` files for: `gem`, `input`, `irb`, `pry`, `screen`
* Colorful file lists!

---

![Colorful files](screens/screen_ls_colors.png "Screenshot of LS_COLORS")

---

**OSX Only features**:

* Autoload for `brew`: brew completions and `autoenv`
* Bunch of useful `alias` examples.
* `rc` files for `ag`, `ack` and `nano`
* Linux style file list if `coreutils` installed from `brew` (*folders on top!*)

### Common aliases

Try these commands:

* `rm`, `mv`, `rmdir`, `mkdir`: You need to confirm!
* `cp`: Preserve attributes and copy verbose by default!
* `l`, `ll`, `la`: Nice Linux-ish (*well 100% same!*) lists.
* `what_is_my_public_ip`, `what_is_my_real_ip`: Using `dig` or `curl` can tell your real IP address!

### OSX aliases

* `desktop_hide`, `desktop_show`: You can show/hide all icons on your desktop via single command!
* `shadow_screenshot_disable`, `shadow_screenshot_enable`: Enable/disable shadows while taking screenshots!
* `ios_backup_disable`, `ios_backup_enable`: Enable/disable backups for your iOS device(s)
* `ds_store_clear`: Delete `.DS_Store` files :)
* `lock_screen`: Going for lunch? lock it asap!

### Common functions/commands

* `dataurl`: Data url for image file: `dataurl my_picture.jpg`
* `gz_analyse`: Analyses gzipped/non-gzipped versions of a file: `gz_analyse my_file.txt`
* `mkdir_cd`: Create folder and cd in to it: `mkdir_cd foo`
* `webserver`: That folder becomes a website! (*via python*): `cd /folder/;webserver`
* `webserver_rb`: That folder becomes a website! (*via ruby*): `cd /folder/;webserver`

---

## Requirements

You need `git` to clone this repo. That’s all you need. **OS X** users can install
git via: `brew install git`. **Ubuntu** users can install git via: 
`sudo apt install -y git-core`. **Gentoo** users can install git via:
`emerge dev-vcs/git`.

---

## Installation

Clone the repo and run install script.

```bash
git clone https://github.com/vigo/dotfiles-universal.git $HOME/Dotfiles
bash $HOME/Dotfiles/install.sh
```

Defaults are:

* `~/.profile`
* `~/.bashrc`
* `~/.inputrc`
* `~/.screenrc`

others are optional:

* `~/.ackrc` will be available if `ag` installed
* `~/.gemrc` will be available if `gem` executable exists
* `~/.irbrc` will be available if `irb` executable exists
* `~/.pryrc` will be available if `pry` gem exists

If you installed `nano` from `brew`, fulfilling nano configuration will be
generated and saved to `~/.nanorc`. Most of the install process is **sym-linking**
except nano configuration.

---

## Configuration

There is almost no-configuration :) There are few extras if you like to use. Put
all your custom / private stuff under `private/` folder. (*Root of the repo*)

    Dotfiles/
    ├── completions
    ├── private           ---> you private stuff!
    ├── ps1
    ├── rc
    ├── startup_sequence
    ├── LICENSE.txt
    ├── README.md
    └── install.sh

Everything under `private` folder will be loaded last therefore you can override
everything. There are two different `PS1` configuration options available:
`PS1_BASIC` and `PS1_ADVANCED`. Default `PS1` value is `PS1_BASIC`. You can
override it under `private/`. 

Here is my `private/` folder structure:

    private/
    ├── alias       # all of my private aliases
    ├── env         # my private env-vars/secrets etc...
    ├── functions   # my custom functions
    └── ps1         # my custom $PS1

If you want to customize your prompt shell, you need to know PS1 elements of this
dot-files :)

### PS1 ELEMENTS

#### `${PROMPT_MEMORY}`
OSX only, displays remaining free memory: `[2.90G]`

#### `${PROMPT_BATTERY}`
OSX only, displays remaining hour(s) on battery mode: `[2:05]`. You can set a 
custom icon via setting `DFF_BATTERY_ICON` variable. Example:

    export DFF_BATTERY_ICON="\xE2\x8C\xA7" # ⌧

#### `${PROMPT_USER_AND_HOSTNAME}`
Outputs `USERNAME at HOSTNAME in CURRENT_WORKING_DIRECTORY`.

#### `${PROMPT_GIT}`
This works if you are under a git repository. Shows current status such as; added,
modified, deleted, renamed, type changed files amount. Example:

    [master @ 297c543ceac8 □:1 ◆:1 ◌:1 | 3]
       |      |            |   |   |     |
       |      |            |   |   |     +-> 3 files will be affected   
       |      |            |   |   +-------> 1 file is deleted
       |      |            |   +-----------> 1 file is modified
       |      |            +---------------> 1 file is untracked
       |      +----------------------------> commit id
       +-----------------------------------> current branch
    
    [development @ b09ab92a87d5 □:1 | 1 →1]
                                        |
                                        +--> this branch is ahead of 'origin/development'
                                             by 1 commit. you need to push it now! :)
    □ : untracked
    ■ : added
    ◆ : modified
    ◇ : renamed
    ◌ : deleted
    ❖ : type changed

git prompt also shows how many commit you are **ahead**/**behind** against your 
tracking remote. If you are in a **rebase**/**bare**/**conflict** mode, git prompt 
shows it to you :)

#### `${PROMPT_HG}`
Mercurial version of `${PROMPT_GIT}`. Example:

    [default @ b63bcee9d5ee+:1+ □:1 ■:2 ◌:2]
        |      |             |  |   |   |
        |      |             |  |   |   +--> 1 file is removed/deleted
        |      |             |  |   +------> 1 file is added
        |      |             |  +----------> 1 file is untracked
        |      |             +-------------> local revision number
        |      +---------------------------> global revision id
        +----------------------------------> current branch
        
    □ : untracked
    ■ : added
    ◆ : modified
    ◌ : deleted        

#### `${PROMPT_RBENV}`
Shows current Ruby version if you are using [rbenv](https://github.com/rbenv/rbenv).

    [◆ 2.3.3] # Ruby version 2.3.3 is active!

#### `${PROMPT_PYENV}`
Shows current Python and [Django](https://www.djangoproject.com/) versions if 
you are using [pyenv](https://github.com/yyuu/pyenv).

    [¶ 2.7.12 | ❡ 1.10.1] # Python 2.7.12 is active!
                          # Django 1.10.1 is active!

#### `${PROMPT_VIRTUALENV}`
Shows current virtualenv information if you are using virtualenv. This would be
kool if you set this: `export VIRTUAL_ENV_DISABLE_PROMPT=1` somewhere in your
`private/` area...

    [☂ my_awesome_env] # :)

#### `${PROMPT_BASH_INFO}`
Shows current bash version.

    [4.4.5(1)-release] # I need to see this sometimes!

#### `${PROMPT_LIST_IPS}`
Shows current available local ip list.

    [en0:192.168.2.205,vboxnet0:192.168.33.1]
    
    # name of interface: IP

#### `${PROMPT_DATABASE_STATUS}`
OSX only, shows if MySQL or PostgreSQL server is running.

    [MySQL] # Helps you to remember is server is on/off

#### `${PROMPT_HORIZONTAL_LINE}`
Draws dashed line along the terminal width. This separates commands.

### PS1_BASIC

Default `PS1` is `PS1_BASIC`.

    # for OSX
    PS1_BASIC="${PROMPT_MEMORY}${PROMPT_BATTERY}
    ${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_GIT}${PROMPT_HG}
    $ "
    
    # for UBUNTU
    PS1_BASIC="${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_GIT}${PROMPT_HG}
    > "
    
    # for GENTOO
    PS1_BASIC="${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_GIT}${PROMPT_HG}
    > "

### PS1_ADVANCED

This includes almost everything :)

    # for OSX
    PS1_ADVANCED="${PROMPT_HORIZONTAL_LINE}
    ${PROMPT_BASH_INFO}${PROMPT_MEMORY}${PROMPT_BATTERY}${PROMPT_LIST_IPS}
    ${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_DATABASE_STATUS}${PROMPT_VIRTUALENV}${PROMPT_RBENV}${PROMPT_PYENV}${PROMPT_GIT}${PROMPT_HG}
    $ "
    
    # for UBUNTU
    PS1_ADVANCED="${PROMPT_HORIZONTAL_LINE}
    ${PROMPT_BASH_INFO}${PROMPT_LIST_IPS}
    ${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_VIRTUALENV}${PROMPT_RBENV}${PROMPT_PYENV}${PROMPT_GIT}${PROMPT_HG}
    > "
    
    # for GENTOO
    PS1_ADVANCED="${PROMPT_HORIZONTAL_LINE}
    ${PROMPT_BASH_INFO}${PROMPT_LIST_IPS}
    ${PROMPT_USER_AND_HOSTNAME}
    ${PROMPT_VIRTUALENV}${PROMPT_RBENV}${PROMPT_PYENV}${PROMPT_GIT}${PROMPT_HG}
    > "

Again, customize yours, create a file, such as `my_ps1` and put it under `private/`:

    export PS1="${PROMPT_USER_AND_HOSTNAME}
    $ "

Thats it!

---

## Change Log

**2017-01-08**

* First release!

**2017-01-06**

* Initial commit

---

## Contributer(s)

* [Uğur "vigo" Özyılmazel](https://github.com/vigo) - Creator, maintainer

---

## Contribute

All PR’s are welcome!

1. `fork` (https://github.com/vigo/dotfiles-fever/fork)
1. Create your `branch` (`git checkout -b my-features`)
1. `commit` yours (`git commit -am 'added killer options'`)
1. `push` your `branch` (`git push origin my-features`)
1. Than create a new **Pull Request**!

***

## License

This project is licensed under MIT

---
