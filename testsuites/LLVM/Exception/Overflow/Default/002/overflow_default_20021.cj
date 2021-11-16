// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException

func test(a:Int64){
    var b = a
    return -b
}

func main(){
    test(-9223372036854775808)
    return 0
}
