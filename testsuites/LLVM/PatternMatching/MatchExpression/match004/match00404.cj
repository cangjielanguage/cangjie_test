// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 0
    let res = match (i) {
        case 0 => 1
        case _ => -1
    }
    if (res == 0) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
