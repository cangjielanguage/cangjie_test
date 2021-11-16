// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class Base {
open func foo(x:Int32):Int32{
return x
}
}

class Data <: Base {
static override func foo(x:Int32):Int32{ // EXPECTED: regex modifiers 'static' and 'override' are conflict in function declaration
return 2*x
}
}

func run(): Int64 {
var res: Int32 = Data.foo(1);
if (res != 2) {
return 1
}
return 0
}

func main(): Int64 {
return run()
}
