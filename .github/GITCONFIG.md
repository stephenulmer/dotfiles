# Ulmer's Git Configuration

This repository contains my ~/.gitconfig, and an additional configuration file
named ~/.gitconfig-pellera. The latter just has a `[user]` section that re-defines
the email address used for commits. This is included for work-related projects.

The main ~/.gitconfig file has several git aliases that I use to manage a third
configuration file named ~/.gitconfig-projects, which is never committed to a VCS.
This is to abstract the names of any customers' projects I might be working on, so
that infomration doesn't wind up in the main configuration (so I can still provide
it here).


## Content of ~/.gitconfig-projects

The file contains a few aliases, a configuration section for each project and a
conditional include if the project needs to additional VCS-managed configuration.

The file could look someting like:

```
[alias]
    cust1 = foreach project.cust1.repo
    mystuff = foreach project.mystuff.repo

[project "mystuff"]
    top = /Users/ulmer/Projects/mystuff
    repo = /Users/ulmer/Projects/mystuff/macos-setup-ansible
    repo = /Users/ulmer/Projects/mystuff/new-server-automation
    repo = /Users/ulmer/Projects/mystuff/some-other-junk

[project "cust1"]
    top = /Users/ulmer/Projects/cust1
    repo = /Users/ulmer/Projects/cust1/collection-automate-stuff
    repo = /Users/ulmer/Projects/cust1/project-for-aap
    repo = /Users/ulmer/Projects/cust1/inventory-test

[incldueIf "gitdir:/Users/ulmer/Projects/cust1"]
    file = /Users/ulmer/.gitconfig-pellera
```

## Git Aliases

The aliases in ~/.gitconfig help to maintain the above file, which mostly exists to
provide a list of repositories to a custom `foreach` alias, that replaces git's own
`for-each-repo`.

Note that the ~/.gitconfig-projects file has an alias for each project, so we can type:

    git cust1 status

and have `git status` run in each of their repos. I use other aliases regularly, like
`mains` to show me the last commit hash for all local and remote *main* or *master*
branches. I often have multiple remotes, and this tells me if the remotes are in sync
with each other as well as my local copy.

I also use an alias, `weekly`, which shows me all of the commits in a repo since the
start of the previous week. This is useful to report activity at weekly status meetings.

To that end, there are aliases named `update-top` and `update-repo`. The first update
the `[alias]` section and places a `top` entry in the appropriate `[project]` subsection.
If an optional second argument is given, it will create an `[includeIf]` for the project's
top diretory to reference a ~/.gitconfig-* file with the name of the second argument.

So to create a project area and config for a new work client, I might run:

    mkdir -p ~/Projects/newclient
    cd ~/Projects/newclient
    git update-top newclient pellera
    ...create or clone some repositories...
    git update-repo newclient

