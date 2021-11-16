// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface Ioo {
}
class Coo <: Ioo{
}

class Data<T> {
}


func run(): Int64 {
    let data: Data<Ioo> = Data<Ioo>() // Coo->Ioo
    var castOP = data as Ioo    // Coo->Ioo
    return 0
}

func main(): Int64 {
    return run()
}
