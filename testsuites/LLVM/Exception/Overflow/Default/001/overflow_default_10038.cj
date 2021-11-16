// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException

func test(a:UInt32,b:UInt32){
    return a*b
}

func main(){
    test(4294967295,2)
    return 0
}
