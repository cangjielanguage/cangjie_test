// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Data().Poo()
    var res2 = Data().Qoo()
    var res3 = Data().Roo(a:4)
    if ( res1 == 4 && res2 ==6 && res3 == 4){
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

interface Base{
    func Poo(a!:Int64):Int64 { return a}
    func Qoo(a!:Int64):Int64
    func Roo(a!:Int64):Int64 { return a}
}



