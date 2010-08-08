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
- pushing (currently with a flaky dependency -- see below. once the following bug is fixed, the dependency won't be flaky anymore: https://bugs.launchpad.net/bzr-fastimport/+bug/347729)

What certainly doesn't:

- empty repositories
- listing remote refs (Bzr doesn't support it via HTTP -- one remote per branch will do the trick)
- using differential import (every revision is exported from bzr each time) -- although the use of mark files should fix the situation, stay tuned :).


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

