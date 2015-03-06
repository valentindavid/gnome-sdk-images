#!/bin/sh

ROOT=`pwd`/build/root
VAR=`pwd`/build/var
APP=`pwd`/packages

HELPER=`which xdg-app-helper`

declare -x LC_ALL=en_US.utf8
declare -x HOME=/self
unset ACLOCAL_FLAGS
declare -x ACLOCAL_PATH="/self/share/aclocal"
declare -x CPLUS_INCLUDE_PATH="/self/include"
declare -x C_INCLUDE_PATH="/self/include"
declare -x GI_TYPELIB_PATH="/self/lib/girepository-1.0"
declare -x LDFLAGS="-L/self/lib "
declare -x PKG_CONFIG_PATH="/self/lib/pkgconfig:/self/share/pkgconfig"
declare -x PATH="/usr/bin:/self/bin"
if test -d packages/.ccache; then
    declare -x PATH="/self/bin/ccache:$PATH"
fi
unset PYTHONPATH
unset INSTALL
unset PERL5LIB

$HELPER -f -w -W -E -a $APP -v $VAR $ROOT/usr env PATH="$PATH" "$@"
