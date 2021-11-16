// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Map<Int32,Int32> = #{1:1}
    var res = match (i) {
        case a : Map<Int32,Int32> => 0
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
