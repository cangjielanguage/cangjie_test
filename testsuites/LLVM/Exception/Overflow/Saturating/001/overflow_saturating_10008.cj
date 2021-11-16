// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowSaturating
func test(a:Int8,b:Int8){
    return a**b
}

func main(){
    return Int64(test(-100,3) - -128)
}
