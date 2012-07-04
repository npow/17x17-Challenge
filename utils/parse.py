#!/usr/bin/env python

import sys

f = open(sys.argv[1])
i = 0
j = 0
for line in f:
  line = filter(lambda x: x != '', line.split(' '))
  if line[2] != '.':
    x, y, z = line[0].split('.')
    sys.stdout.write(z)
    j += 1
    if j % 8 == 0:
      j = 0
      i += 1
      print
    else:
      sys.stdout.write(',')
