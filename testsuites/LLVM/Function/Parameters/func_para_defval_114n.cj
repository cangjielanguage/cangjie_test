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

var x: Int64 = 2
let y: String = "yz"

func Foo(a:Int64,b:String,A:Int64=x,A:String = y):String{ // EXPECTED: regex redefinition of declaration 'A'
return (a+A).toString()+b+B
}

