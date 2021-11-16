// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


record A{
    var a : ArrayList<Unit>
    init(input:ArrayList<Unit>)
    {
        a = input
    }
}

record B<T>{
    var a : ArrayList<T>
    init(input:ArrayList<T>)
    {
        a = input
    }
}

func main(): Int64 {
    var a : ArrayList<Unit> = ArrayList<Unit>(10)
    A(a)
    B<Unit>(a)
    return 0
}