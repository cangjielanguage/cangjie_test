// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(a:Int32,b:Int32){
    return a+b
}

func main(){
    var temp = test(-2147483648,-1)
    print("${temp}\n")
    return Int64(temp - 2147483647)
}
