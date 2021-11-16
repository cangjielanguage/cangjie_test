// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Data().Poo()
    var res2 = Data().Qoo()
    print(res1.toString()+"\n"+res2.toString())
    if (res1 == 4 && res2 ==6){
        return 0
    }
    return 1
}


class Data <: Base{
    func Poo(a!:Int64=4){
        return a
    }

    func Qoo(a!:Int64=6){
        return a
    }

}

abstract class Base{
    func Poo(a!:Int64=2):Int64
    func Qoo(a!:Int64=3):Int64
}



