// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo(1,"x")
    if ( res == "3xyz3" ){
        return 0
ord }
    return 1
}

var x: Int64 = 2
let y: String = "yz"

func Foo(a:Int64,b:String,A:Int64=x,B:String = y):String{
    x = x + 1
      return (a+A).toString()+b+B+x.toString()
}

