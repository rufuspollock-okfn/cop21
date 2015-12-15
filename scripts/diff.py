import difflib
import sys

fromfile = 'agreement/23-oct-2015/index.md'
tofile = 'agreement/4-dec-2015/index.md'
fromlines = open(fromfile, 'U').readlines()
tolines = open(tofile, 'U').readlines()

diff = difflib.HtmlDiff(wrapcolumn=60).make_file(fromlines,tolines,fromfile,tofile, context=True)

fo = open('diff/23-oct-vs-4-dec.html', 'w')
fo.writelines(diff)

