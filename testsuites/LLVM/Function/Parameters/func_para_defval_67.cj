// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Data().Foo()
    print(res1.toString()+"\n")
    if (res1 == 12){
        return 0
    }
    return 1
}


class Data <: Base{
    override func Foo(a!:Int64=4){
        return a*3
    }
}

class Base{
    open func Foo(a!:Int64=2):Int64{
        return a*2
    }
}



