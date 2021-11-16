// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 1
    match (i) {
        case _ => while (false) {0}
   }
    return 0
}

func main(): Int64 {
    return test()
}
