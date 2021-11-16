// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 0
    var a : Map<Int32,Int32> = #{0:1}
    match (i) {
        case _ => a 
    }
    return 0
}

func main(): Int64 {
    return test()
}
