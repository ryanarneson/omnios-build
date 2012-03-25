#!/usr/bin/bash
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2011-2012 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=Pyrex  # App name
VER=0.9.9        # App version
PVER=0.1
PKG=library/python-2/pyrex-26 # Package name (without prefix)
SUMMARY="Pyrex - a Language for Writing Python Extension Modules"
DESC="$SUMMARY"

DEPENDS_IPS="runtime/python-26"

init
download_source $PROG $PROG $VER
patch_source
prep_build
python_build

mv $DESTDIR/usr/bin/pyrexc $DESTDIR/usr/bin/pyrexc2.6
ln -s ./pyrexc2.6 $DESTDIR/usr/bin/pyrexc

strip_install -x
make_package
clean_up
