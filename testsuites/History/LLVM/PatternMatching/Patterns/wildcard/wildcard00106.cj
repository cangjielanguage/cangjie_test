// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var i = [1,1]
    var res = match (i) {
        case [_,1]  => 1
        case _  => 2
    }
    if (res != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
