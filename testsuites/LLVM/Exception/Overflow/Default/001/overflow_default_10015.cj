// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException

func test(a:Int16,b:Int16){
    return a+b
}

func main(){
    test(-30000,-3000)
    return 0
}
