// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(a:Int64){
    var b = a;
    -b
    return b
}

func main(){
    return Int64(test(-9223372036854775808)- -9223372036854775808)
}
