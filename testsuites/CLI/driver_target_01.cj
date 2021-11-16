// EXEC: %compiler %cmp_opt -no-prelude %f -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var value : Int32 = 1
    if (value != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
