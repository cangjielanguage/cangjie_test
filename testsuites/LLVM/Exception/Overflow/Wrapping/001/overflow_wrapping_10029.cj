// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(a:UInt16,b:UInt16){
    return a+b
}

func main(){
    var temp = test(65535,1)
    print("${temp}\n")
    return Int64(temp - 0)
}
