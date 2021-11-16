// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 0
    var res = match (i) {
        case _ : Int8 => 0
        case _ => 5
    }
    if (res != 5) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
