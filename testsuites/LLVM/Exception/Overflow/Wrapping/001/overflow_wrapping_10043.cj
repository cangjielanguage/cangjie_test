// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(a:UInt32,b:UInt32){
    return a-b
}

func main(){
    var temp = test(1,2)
    print("${temp}\n")
    return Int64(temp - 4294967295)
}
