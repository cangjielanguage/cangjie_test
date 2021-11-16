// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    let a: Int32 = 2
    func foo() { return a + 1}
}

class Data <: I {}

func run(): Int64 {
    var data: Data = Data()
    if (I.a == 2 && data.foo() == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
