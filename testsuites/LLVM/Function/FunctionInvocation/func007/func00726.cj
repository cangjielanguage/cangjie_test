// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a:Int32){
    a + 1
}

func main(): Int64 {
    var a :Int32 = 10
    test(a)
    return 0
}
