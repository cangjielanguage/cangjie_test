// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a(ArrayList<Unit>)
}

enum B<T>{
    b(ArrayList<Unit>) |
    c(ArrayList<T>)
}

func main(): Int64 {
    return 0
}