// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Data().Foo()
    var res2 = Base().Pooo()
//    print(res1.toString()+"\n"+res2.toString())
    if (res1 == 11 && res2 ==4){
        return 0
    }
    return 1
}


class Data <: Base{
    func Foo(a!:Int64=1){
        var b: Int64 = super.Poo()
        var c: Int64 = this.Poo()
        return a+b+c
    }

}

open class Base{
    protected func Poo(a!:Int64=2):Int64{
        return a+Po()
    }
    private func Po(a!:Int64=3):Int64{
        return a
    }
    public func Pooo(a!:Int64=4):Int64{
        return a
    }
}


