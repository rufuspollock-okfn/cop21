#!/bin/bash

# SCRIPTS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# AGREEMENT=$SCRIPTS/../agreement
# DIFF=$SCRIPTS/../diff

SCRIPTS=scripts
AGREEMENT=agreement
DIFF=diff

# 2015-10-23 vs 2015-12-04
diff -u99999                                    \
    $AGREEMENT/23-oct-2015/index.md             \
    $AGREEMENT/4-dec-2015/index.md              \
        | python $SCRIPTS/diff2html.py          \
        -a 1 > $DIFF/23-oct-vs-4-dec.html

# 2015-12-04 vs 2015-12-12
diff -u99999                                    \
    $AGREEMENT/4-dec-2015/index.md              \
    $AGREEMENT/index.md                         \
        | python $SCRIPTS/diff2html.py          \
        -a 1 > $DIFF/4-dec-vs-12-dec.html
