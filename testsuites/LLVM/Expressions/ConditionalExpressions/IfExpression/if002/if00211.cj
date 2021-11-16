// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func result(): Bool {
    return true
}

func main(): Int64 {
    if (result()) {
        return 0
    }
    return 1
}
