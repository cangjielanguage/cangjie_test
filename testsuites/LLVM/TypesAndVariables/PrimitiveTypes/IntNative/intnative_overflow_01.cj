// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

//AR-SR-Lang-1014-27 overflow for IntNative
@overflowSaturating
func test(a:IntNative,b:IntNative){
    return a+b
}

func main(){
    return IntNative(test(9223372036854775807,1) - 9223372036854775807)
}