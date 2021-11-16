// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowSaturating
func test(a:UInt32,b:UInt32){
    return a*b
}

func main(){
    return Int64(test(4294967295,2) - 4294967295)
}
