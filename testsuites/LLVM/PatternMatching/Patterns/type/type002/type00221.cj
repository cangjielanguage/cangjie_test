// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int32 {
    var res = match (0..10) {
        case a : Range<Int64> => 0
        case _ => 1
    }
    if (res != 0) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return Int64(test())
}
