// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C<T>{
    var x : ArrayList<T> = ArrayList<T>(10)
    func c(input!:ArrayList<T>=x):ArrayList<T>{input}
}

record R<T>{
    let x : ArrayList<T> = ArrayList<T>(10)
    func r(input!:ArrayList<T>=x):ArrayList<T>{input}
}

interface I<T>{
    let x : ArrayList<T> = ArrayList<T>(10)
    func i(input!:ArrayList<T>=I<T>.x):ArrayList<T>{input}
}

func main(): Int64 {
    return 0
}
