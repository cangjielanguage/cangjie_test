// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo<Int64>(1,"x",3)
    if (res == "3xyz"){
        return 0
    }
    return 1
}

func Foo<T>(a:Int64,b:String,t:T,A!:Int64=2,B!:String = "yz"):String{
    return (a+A).toString()+b+B
}

