// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


/*
func test():Int64 = match (true) {
    case _ => return 2
}
*/

func test():Int64 { match (true) {
    case _ => return 2
    }
}

func main(): Int64 {
    return test() - 2
}