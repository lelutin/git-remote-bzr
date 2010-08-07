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
- bzr-fastimport latest revision (cd ~/.bazaar/plugins; bzr branch lp:bzr-fastimport fastimport)


Usage
-----

1. export the directory that contains git-remote-bzr to your PATH variable for git to find it
2. git clone bzr::url-of-bzr-repository  # Here the url after bzr:: can be anything that bzr accepts

