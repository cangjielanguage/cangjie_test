// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

func run(): Int64 {
var res1 = Foo
var res2 = res1() // EXPECTED: regex missing argument for call with parameter list
// print(res2.toString()+"n")
if (res2 == 4){
return 0
}
return 1
}

var x:Int64 = 2
func Foo(a:Int64=x):Int64{
return a*2
}



