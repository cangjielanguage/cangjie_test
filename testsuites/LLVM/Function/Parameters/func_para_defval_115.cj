// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

var x: Int64 = 2
let y: String = "yz"

func run(): Int64 {
    var res = Foo(1,"x",3)
    if (res == "1xyzA"){
        return 0
    }
    return 1
}

func Foo(a:Int64,b:String,A:Int64,B!:String = y):String{
    var A:String = "A"
      return (a).toString()+b+B+A
}

