// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Base().Goo()
    if (res1 == 7){
        return 0
    }
    return 1
}

record Base{
    private func Foo(a!:Int64=3):Int64{
        return a
    }
    public func Goo(a!:Int64=4):Int64{
        return Foo()+a
    }
}


