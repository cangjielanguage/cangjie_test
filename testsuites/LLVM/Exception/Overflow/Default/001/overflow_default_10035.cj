// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException

func test(a:Int32,b:Int32){
    return a/b
}

func main(){
    test(-2147483648,-1)
    return 0
}
