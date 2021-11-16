// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 1
    var myData : Array<Int32> = @{0}
    match (i) {
        case _ => for (j in myData) {j}
    }
    return 0
}

func main(): Int64 {
    return test()
}
