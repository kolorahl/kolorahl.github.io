---
layout: post
uid: 462065622
title: "Git Tutorial: Easy Mode"
date: 2014-08-22 16:33:42 -0700
permalink: /posts/462065622
---

Note: this tutorial is meant to be used by non-developers, but is also
acceptable for developers looking to get to know the basics of git and proper
git work flow.

If you want to see a more formal git branching strategy, and much more in-depth
introduction to git work flows, please see nvie's post on
[A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/).

I am going to assume that you have a [GitHub](https://github.com/) or
[BitBucket](https://bitbucket.org/) repository set up. If you don't, I am going
to instead assume you or a team member has enough knowledge to set up "forks" of
the repository. Speaking of forks, that is where our tutorial begins...

## Forking: It's Good For You

A repository contains your source files, and it may contain more than one
branch. However, usually a company has a central repository. This is shared and
visible by the entire team (and sometimes more people beyond that). That is why
you want to keep the central repository "clean". What does it mean to have a
clean repo?

1. All changes are tested locally before being pushed to the repo.
2. Only peer-reviewed changes are added to the repo.

It is a simple definition, but it can mean a world of difference as far as
source quality is concerned. There isn't really any way to enforce testing
before pushing code, but if you want to investigate more advanced git features
you can look at "hooks". There is a "before push" hook you can attach to that
allows you to do whatever you want prior to a push, like executing a suite of
local tests and aborting the push if anything fails. But that is outside the
scope of this tutorial.

Using a "pull request" process (explained in detail later) to merge code into
the central repo gives other team members a chance to peer-review the changes
before it ends up in the repo. This is great to have even if the reviews aren't
a long and official process; simply having someone else look at what you did
allows the team to catch a majority of "simple" errors, like mistaken control
flow logic or a misspelled variable name.

In order to help keep central repos clean the concept of a "fork" was brought to
practice. You take the central repo, clone everything about it, and shove that
into a separate repository controlled by the user doing the forking. Now the
user has a replica of the source project, and they can push changes up to their
personal fork without worrying about dirtying the central repo.

For GitHub and BitBucket, when viewing a repo there will be a "Fork" button or
link somewhere on the page that will do all the hard work for you. I'll assume
you now have a forked copy of your project's central repo.

## Branching Thoughts

All repos tend to have a common branch called _master_. This branch should be
considered "deployment ready". Anything that isn't tested and given a green
light for production should not be on the _master_ branch. Thankfully one of the
main selling points of git is cheap branching. You may create, delete, and merge
branches with simplicity and speed. Therefore most people say "create a new
branch for each new feature or development path". Let's say you are adding a
title screen to a game. You might create a branch off master called "title" and
perform all your changes on that branch. To do this, you have two options:

```
[master] > git branch title
[master] > git branch
* master
  title
[master] >
```

The above creates a new branch, _title_, based off the currently checked-out
branch, _master_. However, sometimes we want to create a branch and immediately
begin work on it. Using `git branch <name>` does not change the current branch
for us; we would need to use `git checkout <name>` to do that. However, there is
a two-for-one command that does exactly what we want:

```
[master] > git checkout -b title
[title]  > git branch
  master
* title
[title]  >
```

You can see that immediately after invoking `git checkout` with the `-b` option
(meaning "create branch") that we switched to our new branch _title_. Running
`git branch` with no options confirms this. Now we can begin our work on the
title screen. I won't go over it in much detail, but I will outline the general
work flow here in case someone want's it for reference.

## Work Flow

Once you are on your new branch, start changing things around. Your goal is to
create one or more "commits" that represent the new feature you are working
on. Each commit should be a self-contained unit. Following the title screen
example, I may have one commit that adds the appropriate art and audio assets,
another that creates a scene and adds the appropriate assets, and a final one
that hooks in user interaction components/events. Depending on your feature you
may have fewer or greater changes.

As you are making changes, you may "stage" changes in preparation of a
commit. Only staged files end up in a commit, meaning you can pick and choose
which changes end up in a commit. Use `git add path/to/file` or `git add .` to
stage files for a commit. The former may point to a single file, to stage that
one file, or to a directory, which will stage all changes in that directory and
any sub-directories. The latter will add **everything** in your current
directory and sub-directories to the staging area. Only use it when you know
every change you have belongs in the same logical grouping.

If you accidentally stage files you didn't mean to, fear not! The reset
functionality is there to help: `git reset path/to/file`. You may point to
either a file or a directory, similar to what `git add` allows. However, with
the reset command you may also supply no parameters, which will un-stage
everything: `git reset`.

Every so often you should "save" you commits. Leaving them on your own machine
isn't a good idea, so push out changes frequently: `git push <remote> <branch>`.
In order to better use this feature allow me to digress and talk briefly about
"remotes".

A "remote" is a remote URL that contains a git repo. If your central repo was on
BitBucket, the remote URL might look like
`git@bitbucket.org:Company/project.git`. You personal repository would then look
like `git@bitbucket.org:Me/project.git`. Each remote is given a unique name. I
would recommend naming your personal fork "origin" and the company repo
"upstream". Why? Because "origin" is the default remote name used by many git
commands, and we would rather have the default git behavior be interacting with
our personal fork rather than the central repo.

Alright, back to work flow. Push out your changes regularly, e.g. `git push origin title`.
But wait, there are changes to "upstream/master"! Looks like someone merged in a
new feature that was completed before your own. Let's ensure we have the latest
changes: `git fetch upstream`. This merely grabs the changes from the upstream
remote - it **does not** make changes to your local files. Once you have the
latest changes, time to merge your own changes in a safe manner: `git rebase upstream/master`.
The rebase command is hard to explain, so I won't go into it in detail. Just
keep in mind that sometimes a file will receive a conflict, and you will have to
manually fix it if this happens. After resolving all conflicts you must manually
resume the rebase: `git add . && git rebase --continue`. We do the add first so
that our conflicting files are captured in the continuation of the rebase.

## Pull Requests

Now that you have completed your work on the title screen, are caught up with
the master branch, and have pushed out your changes, it is time to create a pull
request. GitHub and BitBucket both have easy interfaces for creating pull
requests, so follow their respective instructions for doing so. You want you
pull request to go from "Me/project [title]" to "Company/project
[master]". Technically there is a better work flow than using the master branch
for new pull requests, but it is slightly more complex and outside the scope of
this tutorial.

You have now created a pull request, or so I shall assume. You should ping
(email, text, call, whatever) the appropriate team members to review your
changes. For some things, like adding audio, updating art, etc, it will not be
possible to use the built-in pull request utilities to perform a full
review. Instead, do one of the following:

1. Gather all necessary reviewers. Lead them through your changes, explaining
   what you did and why. Allow for questions and comments. If everyone approves,
   have the "lead reviewer" merge the request. Otherwise, make changes and set
   up another review session for later.
2. Allow your reviewers access to your local repo so that they may directly
   check out your changes and inspect it on their own machines. They may then
   email, text, etc, any questions and comments they have. Or you can still do a
   formal review session.

For code you may still go down one of these two paths, but a third option is
available: a strictly visual review where the source code and its differences
are reviewed online using the "diff viewer" provided by GitHub or BitBucket.

Regardless, once a branch is approved and merged, you are done! You may delete
your feature branch and update your personal master branch with the latest
changes.

    git checkout master
    git push origin :title
    git branch -D title
    git fetch upstream
    git rebase upstream/master
    git push origin master

First you move to your master branch. Then you delete your feature branch, first
from your personal fork and then from your local machine. Then you fetch the
merged updates from the pull request. Then you rebase the changes; this should
never have merge conflicts, otherwise your local master branch has become
dirtied and needs to be fixed. Finally, you push out the updated master branch
to your personal fork.

Now rinse and repeat for new features, bug fixes, whatever. I've included a
brief recap of useful git commands. If you have more questions about how to use
specific git commands or how to interact with git, there are two great sites to
use: [git-scm](http://git-scm.com/docs) and [gitref](http://gitref.org/). And,
of course, there is always Google or Bing or whatever other search engine you
may prefer.

Enjoy!

## Command Recap

#### Create a new branch

    git checkout -b <name>

#### Change branches

    git checkout <name>

#### Delete branch

    git push origin :<name>
    git branch -D <name>

The branch command deletes a branch from your local machine, but the odd-syntax
push command deletes a branch from your remote repo.

#### Save changes

    git push origin <name>

#### Update branch

    git fetch upstream
    git rebase upstream/master
    [ ... in case of conflicts ... ]
    git add .
    git rebase --continue
    [ ... repeat conflict resolution flow until complete ... ]

#### Stage changes

    git add path/to/folder/or/file

or

    git add .

#### Un-stage changes

    git reset path/to/folder/or/file

or

    git reset

#### Commit staged changes

    git commit

If you have a one-line commit messages that is 80 characters or fewer in length,
you may supply it to the commit command instead of opening up a text editor:

    git commit -m "Make some changes"

You may also omit the `git add .` if you only have modified files to commit. The
following will not work for new and untracked files.

    git commit -a

The `-a` option means "all modified files".

#### Add changes to the previous commit

If you misspelled something, forgot a file, etc, you may easily update your
previous commit. Just stage the changes as normal, using `git add`, and then add
the amending option to the commit command.

    git commit --amend

This will open up a text editor so that you may update the commit message if
necessary. Otherwise you may leave the message alone and just close out of the
text editor to keep the text unchanged.
