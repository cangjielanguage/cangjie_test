// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var a : Int64 = 1
    var b : Int64 = match (a) {
        case 1 => 0
        case _ => -1
    }
    return b
}

func main(): Int64 {
    return test()
}
