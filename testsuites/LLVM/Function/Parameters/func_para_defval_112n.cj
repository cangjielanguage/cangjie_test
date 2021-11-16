// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

func run(): Int64 {
var res = Foo(1,"x",3)
if (res == "4xyz"){
return 0
}
return 1
}

func Foo(a:Int64,b:String,A:Int64=x,B:String = y):String{ // EXPECTED: regex undeclared identifier 'x'
return (a+A).toString()+b+B
}

