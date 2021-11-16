// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record MyRecord{
    MyRecord(var a : Int32) {}
}
func test(): Int64 {
    match (MyRecord(1)) {
        case _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
