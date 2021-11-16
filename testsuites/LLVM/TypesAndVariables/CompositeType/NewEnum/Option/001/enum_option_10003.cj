// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test() : ?Int64 {
    return 100
}

func main(): Int64 {
    match (test()) {
        case _ : Option<Int64> => 0
        case _ => 1
    }
}
