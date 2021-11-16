// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(a:UInt64){
    var b = -a;
    return b
}

func main(){
    return Int64(test(1)- 18446744073709551615)
}
