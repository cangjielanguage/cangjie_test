// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func myfunc(): Int64 {
    return 0
}

func test(): Int64 {
    var i : Int64 = 0
    match (i) {
        case 1 => test()
        case _ => myfunc()
    }
    return 0
}

func main(): Int64 {
    return test()
}
