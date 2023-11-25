"""Goal: To copy multiple source files into destination files 
command line: # python pyncpy.py src1 src2 src3 ... srcn dest 
Behaviour: Copy the contents of src1 to srcn into a destination file 

If destination file: If it cannot be created due to PermissionError 
then emit an error as such and TERMINATE the program. 

If one of the source cannot be opened because the path is invalid 
or permissions are denied then simply log a message in a text file 
error.log and go to the next file! 
"""
"""
Pseudocode
try: 
	open error log file
except: 
	error on standard output and terminate 

try: 
	open destination file 
except: 
	error in error log file and terminate 
 
for every source file in command line argument list 
	try: 
		open the current source file 
		for every line in src file: 
			write line on destination file 
		close source file
	except: 
		error log  
close destination file 
""" 

"""
python pyncp.py src1 src2 .... srcn dest

src1: argv[1]
srcn : argv[argc-2]
dest: argv[argc-1]
"""
import sys 

def main(argc, argv): 

	if argc < 3: 
		print("Usage Error", argv[0], "source file(s) destination file")
		sys.exit(-1)

	try: 
		f_error_log_handle = open("error.log", "w")
	except PermissionError: 
		print("Log file creation failed")
		sys.exit(-1) 

	try: 
		f_dest_handle = open(argv[argc - 1], "w")
	except PermissionError: 
		print("Destional File could not be created", file = f_error_log_handle)
		f_error_log_handle.close() 
		sys.exit(-1)

	f_current_src_handle = None
	for i in range(1, argc-1): 
		try: 
			f_current_src_handle = open(argv[i], "r")
			print("\n/*FILE NAME : ", argv[i],"*/", file=f_dest_handle)
			for line in f_current_src_handle: 
				print(line, end='', file=f_dest_handle)
			print('/*------------------------------------*/', file=f_dest_handle)
			f_current_src_handle.close()
			f_current_src_handle = None
		except (FileNotFoundError, PermissionError): 
			print("Error in opening source file:", argv[i], file=f_error_log_handle) 

	f_dest_handle.close()
	f_error_log_handle.close()

	sys.exit(0) 

main(len(sys.argv), sys.argv)


