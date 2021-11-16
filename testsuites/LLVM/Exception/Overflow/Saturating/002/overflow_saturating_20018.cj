// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowSaturating
func test(a:UInt32){
    var b = -a;
    return b
}

func main(){
    return Int64(test(1)- 0)
}
