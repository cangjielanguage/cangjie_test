// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

//AR-SR-Lang-1014-27 overflow for IntNative
@overflowWrapping
func test(a:IntNative,b:IntNative){
    return a+b
}

func main(){
    var temp = test(9223372036854775807,1)
    print("${temp}\n")
    return IntNative(temp - -9223372036854775808)
}
