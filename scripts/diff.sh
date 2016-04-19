#!/bin/bash

# SCRIPTS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# AGREEMENT=$SCRIPTS/../agreement
# DIFF=$SCRIPTS/../diff

SCRIPTS=scripts
AGREEMENT=agreement
DIFF=diff
TMPFILE1=23-oct-2015.md
TMPFILE2=4-dec-2015.md
TMPFILE3=9-dec-2015.md
TMPFILE4=12-dec-2015.md

# 2015-10-23 vs 2015-12-04
tail -n +18 $AGREEMENT/23-oct-2015/index.md > $TMPFILE1
tail -n +15 $AGREEMENT/4-dec-2015/index.md > $TMPFILE2
tail -n +15 $AGREEMENT/9-dec-2015/index.md > $TMPFILE3
tail -n +15 $AGREEMENT/index.md > $TMPFILE4

diff -U99999 $TMPFILE1 $TMPFILE2                \
        | python $SCRIPTS/diff2html.py          \
        -a 1 > $DIFF/23-oct-vs-4-dec.html

# 2015-12-04 vs 2015-12-09
diff -U99999 $TMPFILE2 $TMPFILE3                \
        | python $SCRIPTS/diff2html.py          \
        -a 1 > $DIFF/4-dec-vs-9-dec.html

# 2015-12-09 vs 2015-12-12
diff -U99999 $TMPFILE3 $TMPFILE4                \
        | python $SCRIPTS/diff2html.py          \
        -a 1 > $DIFF/9-dec-vs-12-dec.html

rm $TMPFILE1
rm $TMPFILE2
rm $TMPFILE3
rm $TMPFILE4

