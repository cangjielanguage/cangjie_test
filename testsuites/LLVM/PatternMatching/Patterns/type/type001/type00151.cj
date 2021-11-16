// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
type mytype = Int32
func test(): Int64 {
    var i : mytype = 1
    var res = match (i) {
        case i : mytype => 0
        case _ => 1
    }
    if (res != 0) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
