// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func result(): Bool {
    return false
}

func main(): Int64 {
    if (result()) {
        return 1
    }
    return 0
}
