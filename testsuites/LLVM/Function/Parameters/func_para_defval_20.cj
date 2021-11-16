// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var A: Int64 = 4
    var B: String = "ab"
    var res = Foo(1, "x", A:A, B:B)
    if (res == "5xab"){
        return 0
    }
    return 1
}

func Foo(a:Int64,b:String,A!:Int64=2,B!:String = "yz"):String{
    return (a+A).toString()+b+B
}

