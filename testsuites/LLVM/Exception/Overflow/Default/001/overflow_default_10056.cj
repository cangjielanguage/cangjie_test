// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException

func test(a:UIntNative,b:UIntNative){
    return a*b
}

func main(){
    test(18446744073709551615,2)
    return 0
}
