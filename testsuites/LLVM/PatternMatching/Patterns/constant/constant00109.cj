// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 0
    let a : Int32 = 0
    match (i) {
        case 0 | $a => "0"
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
