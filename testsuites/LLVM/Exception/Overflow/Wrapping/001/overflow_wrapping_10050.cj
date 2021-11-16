// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(a:Int64,b:Int64){
    return a*b
}

func main(){
    var temp = test(-9223372036854775808,-1)
    print("${temp}\n")
    return Int64(temp - -9223372036854775808)
}
