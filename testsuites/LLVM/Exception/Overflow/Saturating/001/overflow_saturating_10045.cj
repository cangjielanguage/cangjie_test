// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowSaturating
func test(a:Int64,b:Int64){
    return a*b
}

func main(){
    return Int64(test(9223372036854775807,-2) - -9223372036854775808)
}
