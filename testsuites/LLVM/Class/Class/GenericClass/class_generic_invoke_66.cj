// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T> {
}
class Coo <: I<Int32>{}

class Data<T> {
}

func run(): Int64 {
    let data: Data<I<Int32>> = Data<I<Int32>>()
    var castOP = data as I<Int32>
    return 0
}

func main(): Int64 {
    return run()
}
