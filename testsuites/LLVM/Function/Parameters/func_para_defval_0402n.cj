// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

func run(): Int64 {
var res = Foo()
if (res == 3){
return 0
}
return 1
}

// Aborted (core dumped)
func Foo(a:Int64=b){ // EXPECTED: regex undeclared identifier 'b'
var b: Int64 = 2
return a+b
}

