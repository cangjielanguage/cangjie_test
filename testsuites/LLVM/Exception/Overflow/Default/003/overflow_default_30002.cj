// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException

@overflowThrowing
func test(a:Int8,b:Int8){
    return a+b
}

func main(){
    test(-100,-100)
    return 0
}
