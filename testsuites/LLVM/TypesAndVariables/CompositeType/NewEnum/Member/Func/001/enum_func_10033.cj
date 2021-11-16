// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a
    operator func ()() {0}
}

func main(): Int64 {
    var x = a()
    return 0
}
