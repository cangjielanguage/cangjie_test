// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException

@overflowThrowing
func test(a:UInt16,b:UInt16){
    return a*b
}

func main(){
    test(60000,2)
    return 0
}
