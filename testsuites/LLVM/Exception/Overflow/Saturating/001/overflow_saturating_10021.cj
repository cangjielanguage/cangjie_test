// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowSaturating
func test(a:Int16,b:Int16){
    return a**b
}

func main(){
    return Int64(test(-30000,3) - -32768)
}
