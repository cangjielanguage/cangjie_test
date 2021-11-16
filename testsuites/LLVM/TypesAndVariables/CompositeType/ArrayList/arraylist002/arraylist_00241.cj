// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a(ArrayList<T>)
}

func main(): Int64 {
    A<Int64>.a(ArrayList<Int64>(1))
    return 0
}