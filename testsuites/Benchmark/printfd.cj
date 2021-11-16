// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import os.*
from ffi import c.*
func printfd(n : Int64) {
	var a = `open`(CString("/dev/null"), O_WRONLY)
	for (i in 0..n) {
	  var buf = CString("${i} ${i+1}\n")
		write(a, buf.getChars(), UIntNative(buf.size()))
	}
	close(a)
}

func main() {
  printfd(10000)
}
