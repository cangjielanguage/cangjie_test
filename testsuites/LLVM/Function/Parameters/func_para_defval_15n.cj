// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

func run(): Int64 {
var res = Foo(1,"x")
if (res == "3xyz"){
return 0
}
return 1
}

func Foo(a:Int64,A!:Int64=2,B!:String = "yz",b:String):String{ // EXPECTED: regex named parameters must be listed behind all non-named parameters
return (a+A).toString()+b+B
}

