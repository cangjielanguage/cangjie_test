// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 1
    let j : Int32 = 2
    var res = match (i) {
        case a : Int8 => 3
        case $j => 2
        case _ => 1
    }
    if (res == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return test()
}
