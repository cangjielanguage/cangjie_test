// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Data.Poo()
    var res2 = Data.Pooo() 
    print(res1.toString()+"\n"+res2.toString())
    if (res1 == 6 && res2 ==4){
        return 0
    }
    return 1
}


class Data <: Base{
    redef static func Poo(a!:Int64=1){
        var b: Int64 = Base.Poo()
        return a+b
    }
}

open class Base{
    static protected func Poo(a!:Int64=2):Int64{
        return a+Po()
    }
    static private func Po(a!:Int64=3):Int64{
        return a
    }
    static public func Pooo(a!:Int64=4):Int64{
        return a
    }
}


