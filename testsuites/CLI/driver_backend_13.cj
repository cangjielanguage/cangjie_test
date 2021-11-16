// EXEC: %compiler %cmp_opt -backend-options="-L/root/code/Char/output/bin/../lib" 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex expected at least one source code file when compiling source code

func main(): Int64 {
return run()
}

func run(): Int64 {
var b:Base = Base()
return 0
}


class Base{
var a: Int32 = 3
}

