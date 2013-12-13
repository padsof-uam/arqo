#!/usr/bin/python
import sys

def write_colspec(f, num):
	f.write('{')
	for i in range(num):
		f.write('|c')

	f.write('|}\n')

if len(sys.argv) != 3:
	print 'Wrong args!'
	sys.exit(0)

dat_f_name = sys.argv[1]
tex_f_name = sys.argv[2]
dat_f = open(dat_f_name, 'r')
tex_f = open(tex_f_name, 'w')

tex_f.write('\\begin{tabular}')

header_written = False
colspec_written = False

for line in dat_f:
	cols = [x.replace('\"','') for x in line.split('\t') if len(x.strip()) != 0]

	if not colspec_written:
		write_colspec(tex_f, len(cols))
		colspec_written = True

	tex_f.write('\\hline')
	amp = ''
	for col in cols:
		if header_written:
			tex_f.write('{0} {1}'.format(amp, col))
		else:
			tex_f.write('{0} \\textbf{{{1}}}'.format(amp, col))
		amp = ' &'

	header_written = True
	
	tex_f.write('\\\\ \n')	

tex_f.write('\\hline')
tex_f.write('\\end{tabular}')


