// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(a:UInt8){
    var b = a;
    b--
    return b
}

func main(){
    return Int64(test(0)- 255)
}
