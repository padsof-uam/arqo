#!/usr/bin/python
import sys
fname=sys.argv[1]
f=open(fname,"r")
fout=open("Ejer3_acc.dat","w")
fout.write(f.readline())

refval_set = False
refval = 0

for line in f.readlines():
	values=line.split('\t')

	fout.write(values[0])
	if not refval_set:
		refval = float(values[1])
		print 'setting reference value to {0}'.format(refval)
		refval_set = True
		fout.write('\t1')
		values = values[2:]
	else:
		values = values[1:]

	for value in map(float,values):
		fout.write('\t{0:.6f}'.format(refval/value))
	fout.write('\n')

