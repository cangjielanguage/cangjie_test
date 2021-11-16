// EXEC: %compiler -typecheck %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?'-typecheck' is a frontend option, require '-frontend' as the first option

func main(): Int64 {
return run()
}

func run(): Int64 {
var b:Base = Base(b:5)
var f = b.foo(a:5)
var g = foo(a:5)
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
