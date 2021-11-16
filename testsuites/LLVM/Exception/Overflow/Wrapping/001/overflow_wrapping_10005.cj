// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(a:Int8,b:Int8){
    return a*b
}

func main(){
    var temp = test(127,2)
    print("${temp}\n")
    return Int64(temp - -2)
}
