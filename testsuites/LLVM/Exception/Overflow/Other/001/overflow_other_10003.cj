// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception
// ASSERT: scan overflow_other_10003.cj:7
@overflowThrowing
func test(a:Int8,b:Int8){
    return (a+b)-1 // a+b will overflow.
}

func main(){
    return Int64(test(127,1))
}
