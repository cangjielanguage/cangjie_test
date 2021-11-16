// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test() : Char {
    return 'a'
}

func main() : Int64 {
    if (test() == 'a') {
        return 0
    }
    return 1
}
