// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a(Int64)
    operator func -():Int64{0}
}


func main(): Int64 {
    return -A.a(1)
}
