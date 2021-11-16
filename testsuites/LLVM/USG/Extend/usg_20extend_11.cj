// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

extend Int64 {
    prop let i: Int64 {
        get() {
            return 0
        }
    }
}

func main() {
    1.i+1
    return 0
}
