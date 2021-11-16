// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test() : Int32 {
    return 1 + 1
}

func main() : Int64 {
    if (test() == 2) {
        return 0
    }
    return 1
}
