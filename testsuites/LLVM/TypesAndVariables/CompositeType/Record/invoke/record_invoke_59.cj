// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I <T>{
    func a(): Int32{
        2
    }
}

class B<T> <: I<T>{}

record Data<T> {
    let recIf: T
    init(x: T){
        recIf = x
    }
}

func run(): Int64 {
    let data: Data<I<Int32>> = Data<I<Int32>>(B<Int32>())
    var recIf: I<Int32> = data.recIf
    var res: Int32 = recIf.a()
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
