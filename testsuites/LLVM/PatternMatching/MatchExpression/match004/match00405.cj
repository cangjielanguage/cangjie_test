// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 0
    var res = match (i) {
        case 1 => 1
        case _ => i
    }
    if (res == 0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return test()
}
