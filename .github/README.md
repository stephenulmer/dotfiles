# Managing Dotfiles

This is a repository of my dotfiles.

You should make a repository of your own, but this is how I deploy this one:

    REPO_DOTFILES="git@github.com:stephenulmer/dotfiles"  # where to clone from
    GIT_DIR=${HOME}/.dotfiles ; GIT_WORK_TREE=${HOME}     # tell git where the parts will be
    export GIT_DIR GIT_WORK_TREE                          # add variables to environment. POSIX-ly.
    git clone --bare $REPO_DOTFILES ${GIT_DIR}            # get a local copy of the BARE repo
    git checkout main .                                   # copy files into place
    git config --local --bool core.bare false             # turn off the local bare repo flag
    git config --local status.showUntrackedFiles no       # pre-ignore any files not checked in
    unset GIT_DIR GIT_WORK_TREE                           # make git normal again


## Seurity and Keys

I've started to keep *all* of my key-type-things in 1Password. I recently discovered that 1Password would vault my SSH keys -- so I'm trying to do that with all of the key containing files so the keys never touch the file system unencrypted. This leads to several "helper" files and applications, and the configuration for those application will be included eventually.

I used to have a private repo, not hosted anywhere and transported with `git bundle`, that contained some cleartext keys. This public repo was started from a new `git init` and contains none of that history. If keys in here are unavoidable, I'll look into git-crypt and store the symmetric key in 1Password.


## Known Defects

The `dotfilemode` and `nodotfilemode` functions (in the `.zshrc`) use `GIT_GIR=${HOME}/.dotfiles`. There is no technical linkage betwen those functions and the above instructions, so if you need a different name or location you will have to change both. This is a chicken/egg problem that would require a file edit and commmit during the setup to solve. In my opinion it is not worth the complexity.

There isn't currently an included `.bashrc`. I need to write one and then DRY things out.


## Motivation

I've been managing the account configuration files for my systems for over three decades. In some form or another there have been m4 macros, "The World's Longest Login (tm)" aka a *complete* .cshrc, symlinks into a CVS repo checkout that eventually became a repo in my private Subversion server. Before git, there was even a period of, "Screw it, here's a tarball."


## Foundation of Others' Work

The idea of using a bare git repository and a disconnected workdir came from this blog post:

> [Harfang's Perch](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)

I tried, but couldn't make my hands type `dotfiles` when passing command arguments via an allias. That's a reasonable approach, but the gold here is the bare repo part. I eventually decided that editing dotfiles was a **mode** and implemented shell functions to enter and exit that mode.
