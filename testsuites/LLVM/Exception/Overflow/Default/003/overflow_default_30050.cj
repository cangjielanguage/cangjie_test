// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException

@overflowThrowing
func test(a:UInt64,b:UInt64){
    return a-b
}

func main(){
    test(1,2)
    return 0
}
