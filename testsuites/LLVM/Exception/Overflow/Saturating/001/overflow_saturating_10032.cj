// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowSaturating
func test(a:Int32,b:Int32){
    return a*b
}

func main(){
    return Int64(test(2147483647,-2) - -2147483648)
}
