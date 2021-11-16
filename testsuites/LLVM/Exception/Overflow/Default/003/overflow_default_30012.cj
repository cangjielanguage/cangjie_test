// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException

@overflowThrowing
func test(a:UInt8,b:UInt8){
    return a*b
}

func main(){
    test(100,3)
    return 0
}
