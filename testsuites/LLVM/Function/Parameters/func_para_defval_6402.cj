// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Base().Foo()
//    var res1 = Base().Foo(2)
//    print(res1.toString()+"\n")
    if (res1 == 4){
        return 0
    }
    return 1
}


class Data <: Base{
}

open class Base{
    private var x:Int64 = 2
    public func Foo(a!:Int64=x):Int64{
        return a*2
    }
}



