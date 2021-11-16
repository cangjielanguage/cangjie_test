// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
return run()
}

func run(): Int64 {
var b:Base = Base(b:5)
var f = b.foo(a:"5") // EXPECTED: regex no matching function declaration for function call 'foo'
var g = foo(a:"5") // EXPECTED: regex invalid named arguments prefix 'a:', target is not a named parameter
return 0
}


class Base{
init(a:Int32=1){print("init1n")}
init(b:Int32=1,c:Int32=1){print("yesn")}

func foo(a:Int32=1){print("yesn")}
func foo(b:Int32=1,c:Int32=1){print("foo2n")}
}
func foo(a:Int32=1){print("yesn")}
func foo(b:Int32=1,c:Int32=1){print("foo2n")}
