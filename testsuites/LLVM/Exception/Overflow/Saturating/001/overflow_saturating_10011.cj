// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowSaturating
func test(a:UInt8,b:UInt8){
    return a-b
}

func main(){
    return Int64(test(1,2) - 0)
}
