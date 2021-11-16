// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a(?A) | b
}

func main(): Int64 {
    var x = a(b)
    return 0
}
