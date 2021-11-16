// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 1
    match (i) {
        case 1 | 1 => "0"
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
