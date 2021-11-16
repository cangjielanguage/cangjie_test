// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    func myfunc():Int32{return 0}
    match (myfunc) {
        case _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
