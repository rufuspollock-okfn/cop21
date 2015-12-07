def tidy(text):
    # indented (a) -> 1. (b) -> 2.
    for idx, x in enumerate('abcdefghijkl'):
        text = text.replace('    ' + '(%s)' % x, '    %s.' % (idx+1))
    return text

def test():
    text = '''

    1. hello there

        hello some more

        (a) abc
        (b)
    '''
    out = tidy(text)
    print out
    assert '(a)' not in out
    assert '    1. abc' in out

if __name__ == '__main__':
    path = '23-oct-2015/index.md'
    text = open(path).read()
    out = tidy(text)
    print out[:20]
    fo = open(path, 'w')
    fo.write(out)
    fo.close()

