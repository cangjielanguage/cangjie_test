// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowSaturating
func test(a:UInt16,b:UInt16){
    return a+b
}

func main(){
    return Int64(test(60000,6000) - 65535)
}
