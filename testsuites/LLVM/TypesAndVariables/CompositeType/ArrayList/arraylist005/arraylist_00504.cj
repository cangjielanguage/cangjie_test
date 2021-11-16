// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    var a : ArrayList<Unit> = ArrayList<Unit>(10)
}

class B<T>{
    var a : ArrayList<Unit> = ArrayList<Unit>(10)
    var b : ArrayList<T> = ArrayList<T>(10)
}

func main(): Int64 {
    return 0
}