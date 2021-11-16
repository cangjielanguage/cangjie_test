// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func foo(x: Int32): String {
return x.toString()
}

func main():Int64{
var res = foo("HI") // EXPECTED: regex no matching function declaration for function call
if (res == "HI") {
return 0
}
return 1
}
