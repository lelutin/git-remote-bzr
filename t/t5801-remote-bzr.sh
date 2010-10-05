#!/bin/sh
#
# Copyright (c) 2010 Gabriel Filion
#
# NOTE: The 'bzr-fastimport' plugin is needed to test functionality of this
# remote helper. It needs to either be visible as a site-wide Bazaar plugin, or
# the BZR_PLUGIN_PATH environment variable can be exported with the absolute
# path to the directory containing the plugin.

test_description='Test import and export of commits to Bazaar'

. ./test-lib.sh

if test_have_prereq PYTHON && "$PYTHON_PATH" -c '
import sys
if sys.hexversion < 0x02040000:
    sys.exit(1)
'
then
    # Requires Python 2.4 or newer
    if $(bzr plugins | grep -q fastimport)
    then
        bzr whoami "$GIT_COMMITTER_NAME <$GIT_COMITTER_EMAIL>"
        test_set_prereq BZR_FASTIMPORT
    fi
fi

test_expect_success BZR_FASTIMPORT 'setup repository' '
	bzr init public &&
	(cd public &&
	 echo content >file &&
	 bzr add &&
	 bzr commit -m one)
'

test_expect_success BZR_FASTIMPORT 'clone from local repo' '
	git clone "bzr::${PWD}/public" localclone &&
	test_cmp public/file localclone/file
'

test_expect_success BZR_FASTIMPORT 'create new commit on remote' '
	(cd public &&
	 echo content >>file &&
	 bzr commit -m two)
'

# This is weird. if I type commands up to here, it works, but the test doesn't.
# something must be different, but what?
test_expect_success BZR_FASTIMPORT 'pull from local repo' '
	(cd localclone && git pull) &&
	test_cmp public/file localclone/file
'

# not really accurate: failing the previous test makes this one pass
test_expect_success BZR_FASTIMPORT 'push to local repo' '
	(cd localclone &&
	echo content >>file &&
	git commit -a -m three &&
	git push) &&
	test_cmp public/file localclone/file
'

test_done
