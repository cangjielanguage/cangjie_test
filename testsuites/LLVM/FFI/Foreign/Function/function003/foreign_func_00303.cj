// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

foreign func a():Unit

foreign {
func b():Unit
}

var x = a(1) // EXPECTED: regex extra argument given for call with parameter list: ()
var y = b(1) // EXPECTED: regex extra argument given for call with parameter list: ()