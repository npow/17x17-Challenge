#!/usr/bin/env python

import sys

f = open(sys.argv[1])
L = []
for line in f:
  line = line[:-1].split(',')
  print line
  L.append(line)

def check(L):
  nx = len(L[0])
  ny = len(L)
  for i in xrange(nx):
    for j in xrange(ny):
      for ii in xrange(nx):
        for jj in xrange(ny):
          if i == ii or j == jj:
            continue
          if L[i][j] == L[i][jj] and L[i][jj] == L[ii][j] and L[i][jj] == L[ii][jj]:
            return False
  return True

print check(L)
