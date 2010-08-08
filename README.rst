git-remote-bzr
==============

This is a Bazaar remote helper for git. It uses the remote helpers
functionality introduced recently in git.

As this is only an early proof of concept, it is not recommended for any
use, except maybe documentation about using git remote helpers or satisfying
your curiosity.

What may work:

- small repositories
- cloning local branches

What certainly doesn't:

- empty repositories
- pushing (check out the bug report at: https://bugs.launchpad.net/bzr-fastimport/+bug/347729)
- listing remote refs (is Bzr even capable of this via HTTP?)
- using differential import (every revision is exported from bzr each time)


Requirements
------------

- git 1.6.6 or later
- python 2.5 +
- bzr 2.x
- bzr-fastimport : for now, only the branch lp:~ian-clatworthy/bzr-fastimport/new-marks-format with the patch inside patches/fastimport-sane-marks.patch works for pushing back your commits to the bzr branch. With g-r-b being the full path to the git-remote-bzr source directory, do: (mkdir -p ~/.bazaar/plugins/; cd ~/.bazaar/plugins; bzr branch lp:~ian-clatworthy/bzr-fastimport/new-marks-format fastimport; patch -p0 < g-r-b/patches/fastimport-sane-marks.patch)


Usage
-----

1. export the directory that contains git-remote-bzr to your PATH variable for git to find it
2. git clone bzr::url-of-bzr-repository  # Here the url after bzr:: can be anything that bzr accepts

