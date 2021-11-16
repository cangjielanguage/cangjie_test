// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{
    let a : ArrayList<Unit> = ArrayList<Unit>(10)
}

interface B<T>{
    let a : ArrayList<Unit> = ArrayList<Unit>(10)
    let b : ArrayList<T> = ArrayList<T>(10)
}

func main(): Int64 {
    return 0
}