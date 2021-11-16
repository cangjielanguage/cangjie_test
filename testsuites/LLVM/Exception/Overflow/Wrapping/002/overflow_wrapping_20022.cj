// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(a:UInt64){
    var b = a;
    b++
    return b
}

func main(){
    return Int64(test(18446744073709551615)- 0)
}
