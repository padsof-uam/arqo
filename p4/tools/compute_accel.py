#!/usr/bin/python
import sys

ref_cell_first = False

if len(sys.argv) < 3:
	print 'usage: {0} source destiny [col|cell]\n'.format(sys.argv[0])
	sys.exit(1)

source_name = sys.argv[1]
dest_name = sys.argv[2]

if len(sys.argv) > 3:
	ref_cell_first = (sys.argv[3] == 'cell')

print 'compute_accel.py: processing for speedup {0} -> {1}'.format(source_name, dest_name)

if ref_cell_first:
	print 'compute_accel.py: using first cell as reference for the whole table'
else:
	print 'compute_accel.py: using first cell of each row as reference value for that row'

fin = open(source_name, 'r')
fout = open(dest_name, 'w')

# Header
fout.write(fin.readline())

refval = 0
rows = 0
for line in fin.readlines():
	values = line.split('\t')

	fout.write(values[0]) # Row ID.

	# Set reference value.
	# If ref_cell_first == True, we use only the first cell as reference value.
	# If not, we use the first cell *of each row* as reference value for that row.
	if refval == 0 or not ref_cell_first:
		refval = float(values[1])
		fout.write('\t1')
		values = values[2:]
	else:
		values = values[1:]

	for value in map(float,values):
		fout.write('\t{0:.6f}'.format(refval/ value))

	fout.write('\n')
	rows = rows + 1

fout.close()
fin.close()

print 'compute_accel.py: done. Written {0} rows.'.format(rows)
