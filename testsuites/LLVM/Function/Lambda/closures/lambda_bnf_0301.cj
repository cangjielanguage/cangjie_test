// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}


var b = { class Coo{} } // EXPECTED: regex 'class' is not allowed in block, expected expression or declaration here
var b1 = b()

var c = { class Coo } // EXPECTED: regex 'class' is not allowed in block, expected expression or declaration here
var c1 = c()

var d = { enum TimeUnit{ Year } } // EXPECTED: regex enum type must be toplevel
var d1 = d()

var e = { extend String{} } // EXPECTED: regex 'extend' is not allowed in block, expected expression or declaration here
var e1 = e()
