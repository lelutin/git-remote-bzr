git-remote-bzr
==============

NOTE: This project has been abandoned before reaching completion. You may be interested in `felipec's git-remote-bzr <https://github.com/felipec/git-remote-bzr>`_ which is a more advanced remote support for bzr in git which also supports push.

This is a Bazaar remote helper for git. It uses the remote helpers
functionality introduced recently in git.

As this is only an early proof of concept, it is not recommended for any
use, except maybe documentation about using git remote helpers or satisfying
your curiosity.

What may work:

- somewhat small repositories
- cloning local and remote branches

What's being stopped by bugs in dependencies

- pushing [1]
- using differential import (marks files) [2]
- importing more than once (intermittent bug) [3]

What certainly doesn't:

- empty repositories
- listing remote refs (Bzr doesn't support it via HTTP -- one remote per branch will do the trick)

Relevant bug reports
--------------------

[1]:https://bugs.launchpad.net/bzr-fastimport/+bug/347729 (I've fixed a bug on Ian's branch but I've hit another one with using mark_files)
[2]:https://bugs.launchpad.net/bzr-fastimport/+bug/655839 (differential pull + tags is broken)
[3]:https://bugs.launchpad.net/bzr-fastimport/+bug/541626

Requirements
------------

- git 1.6.6 or later
- python 2.5 +
- bzr 2.x
- bzr-fastimport
  - (this branch is now ~50 commits behind trunk) for now, only the branch lp:~ian-clatworthy/bzr-fastimport/new-marks-format with the patch inside patches/fastimport-sane-marks.patch works for pushing back your commits to the bzr branch. With g-r-b being the full path to the git-remote-bzr source directory, do: (mkdir -p ~/.bazaar/plugins/; cd ~/.bazaar/plugins; bzr branch lp:~ian-clatworthy/bzr-fastimport/new-marks-format fastimport; patch -p0 < g-r-b/patches/fastimport-sane-marks.patch)


Usage
-----

1. export the directory that contains git-remote-bzr to your PATH variable for git to find it
2. git clone bzr::url-of-bzr-repository  # Here the url after bzr:: can be anything that bzr accepts


Testing
-------

A test file is included in the t/ directory. However, this file depends on
git's test-lib.sh to work. Since the latter needs to be in a git repository, I
won't create a special version of test-lib.sh just so that it can be used
independantly. The file is included here in order to have everything in a small
repository to make it easier to review.

If you are interested in running the tests, check out my git mirror at:

http://github.com/lelutin/git

Make sure you are on the 'remote-bzr' branch and run 'make' on the top level.
You will then be able to cd into the t/ directory and run only remote-bzr's
tests by issuing the following command:

./t5810-remote-bzr.sh

Before running the test, you either need to install 'bzr-fastimport' in a
site-wide location, or to export the BZR_PLUGIN_PATH environment variable with
the absolute path to the directory that contains the plugin.
