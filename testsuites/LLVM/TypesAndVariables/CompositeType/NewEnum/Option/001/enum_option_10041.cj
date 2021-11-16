// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(a!:?Int64=Some(100)){return a}

func main(): Int64 {
    match (test()) {
        case _ : Option<Int64> => 0
        case _ => 1
    }
}
