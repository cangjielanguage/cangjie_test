// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo(A:3,a:1,B:"ab",b:"x")
    if (res == "4xab"){
        return 0
    }
    return 1
}

func Foo(a!:Int64,b!:String,A!:Int64=2,B!:String = "yz"):String{
    return (a+A).toString()+b+B
}

