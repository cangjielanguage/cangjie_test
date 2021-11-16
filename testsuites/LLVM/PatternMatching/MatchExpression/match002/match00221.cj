// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record MyRecord{}


func test(): Int64 {
    var a = match (MyRecord()) {
        case _ => 0
    }
    return a
}

func main(): Int64 {
    return test()
}
