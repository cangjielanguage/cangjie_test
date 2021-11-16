// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    func a(): Int32 {2}
}

class B <: I{}

record Data<T> {
    let recIf: T
    Data(x: T){
        recIf = x
    }
}

func run(): Int64 {
    let a : I = B()
    let data: Data<I> = Data<I>(B())
    var recIf: I = data.recIf
    var res: Int32 = recIf.a()
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
