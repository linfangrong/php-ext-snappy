dnl $Id$
dnl config.m4 for extension snappy

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(snappy, for snappy support,
dnl Make sure that the comment is aligned:
dnl [  --with-snappy             Include snappy support])

dnl Otherwise use enable:

PHP_ARG_ENABLE(snappy, whether to enable snappy support,
dnl Make sure that the comment is aligned:
[  --enable-snappy           Enable snappy support])

if test "$PHP_SNAPPY" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-snappy -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/snappy.h"  # you most likely want to change this
  dnl if test -r $PHP_SNAPPY/$SEARCH_FOR; then # path given as parameter
  dnl   SNAPPY_DIR=$PHP_SNAPPY
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for snappy files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       SNAPPY_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$SNAPPY_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the snappy distribution])
  dnl fi

  dnl # --with-snappy -> add include path
  dnl PHP_ADD_INCLUDE($SNAPPY_DIR/include)

  dnl # --with-snappy -> check for lib and symbol presence
  dnl LIBNAME=snappy # you may want to change this
  dnl LIBSYMBOL=snappy # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $SNAPPY_DIR/$PHP_LIBDIR, SNAPPY_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_SNAPPYLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong snappy lib version or lib not found])
  dnl ],[
  dnl   -L$SNAPPY_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(SNAPPY_SHARED_LIBADD)

  PHP_REQUIRE_CXX()
  PHP_SUBST(SNAPPY_SHARED_LIBADD)
  PHP_ADD_LIBRARY(stdc++, 1, SNAPPY_SHARED_LIBADD)
  PHP_NEW_EXTENSION(snappy, snappy.c snappy/snappy-c.cc snappy/snappy.cc snappy/snappy-sinksource.cc snappy/snappy-stubs-internal.cc, $ext_shared)
fi
