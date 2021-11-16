// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

func run(): Int64 {
var res = Foo(1,"x","xx") // EXPECTED: regex no matching function declaration for function call
if (res == "4xxx"){
return 0
}
return 1
}

func Foo(a:Int64,b:String,A:Int64=2,B:String = "yz"):String{
return (a+A).toString()+b+B
}

