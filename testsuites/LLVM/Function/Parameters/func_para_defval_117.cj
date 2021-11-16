// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

var x: Int64 = 2
let y: String = "yz"

func run(): Int64 {
    var res = Foo(1,"x")
    if (res == "3xyz3"){
        return 0
    }
    return 1
}

func Foo(a:Int64,b:String,A!:Int64=x,B!:String = y):String{
    x = x + 1
      return (a+A).toString()+b+B+x.toString()
}

