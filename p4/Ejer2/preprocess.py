#!/usr/bin/python
import sys
fname=sys.argv[1]
f=open(fname,"r")
fout=open("Ejer2_acc.dat","w")
fout.write(f.readline())
for line in f.readlines():
	values=line.split('\t')
	serie=float(values[1])
	fout.write('{0}\t{1}'.format(values[0],1))
	for value in map(float,values[2:]):
		fout.write('\t{0:.6f}'.format(value/serie))
	fout.write('\n')

