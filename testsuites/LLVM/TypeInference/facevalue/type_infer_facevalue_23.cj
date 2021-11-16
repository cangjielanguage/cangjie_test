// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo(): Int64 {
    return 3
    return 0
}

func main(): Int64 {
    3
    var a = 3
    if (foo() == 3) {
        return 0
    }
    return 1
}
