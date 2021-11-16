// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func foo1(): Int8 { // EXPECTED: regex type of function body is incompatible with return type
1+1+2.0
}

func foo3(): Int64 {  // EXPECTED: regex type of function body is incompatible with return type
var i: Float32 = 10
3/2 + i
}
func foo4(): Float64 {
3/2 + 10
}

func main(): Int64 {
var res4: Float64 = foo4()
if (res4 != 11.5) {
return 1
}
return 0
}