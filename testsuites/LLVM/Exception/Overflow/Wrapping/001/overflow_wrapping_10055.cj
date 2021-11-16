// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(a:UInt64,b:UInt64){
    return a+b
}

func main(){
    var temp = test(18446744073709551615,1)
    print("${temp}\n")
    return Int64(temp)
}
