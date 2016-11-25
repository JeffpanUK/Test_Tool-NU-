import os,sys

def parse_pattern(pattern):
	pattern=pattern.split(',')
	print pattern
	return pattern

def main(logdir, logname, pattern, output):
	out=open(output,'w')
	pattern = parse_pattern(pattern)
	logs=filter(lambda x: logname in x, os.listdir(logdir))
	for log in logs:
		logfile=open(logdir+'/'+log,'r')
		flag=0
		linep='\n'
		out.write('-----'+log+'-----\n')
		for line in logfile:
			if "rate" in line:
				out.write(line)
			for pat in pattern:
				print pat
				if pat in line and flag==1:
					out.write(linep)
					print linep
					print pat
					flag=0
					break
				elif pat in line:
					flag=1
			linep=line
		logfile.close()
	out.close()

if __name__ == '__main__':
	from argparse import ArgumentParser
	parser = ArgumentParser(description='read log files')
	parser.add_argument("--version", action="version", version="ver 0.1")
	parser.add_argument('logdir', type=str)
	parser.add_argument('logname',type=str)
	parser.add_argument('pattern',type=str)
	parser.add_argument('output',type=str)
	args = parser.parse_args()
	main(args.logdir, args.logname, args.pattern, args.output)
		
