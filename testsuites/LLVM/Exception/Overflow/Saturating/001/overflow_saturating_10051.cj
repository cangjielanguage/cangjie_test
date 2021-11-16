// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowSaturating
func test(a:UInt64,b:UInt64){
    return a*b
}

func main(){
    return Int64(test(18446744073709551615,2) - 18446744073709551615)
}
