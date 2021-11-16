// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(a:Int16,b:Int16){
    return a-b
}

func main(){
    var temp = test(32767,-1)
    print("${temp}\n")
    return Int64(temp - -32768)
}
