// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    A(let a : ?Int64){}
}

func main(): Int64 {
    A(1)
    return 0
}