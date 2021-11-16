// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 2

@overflowWrapping
func test(a:Int64,b:Int64){
    return a*b
}

func main(){
    var temp = test(9223372036854775807,-2)
    print("${temp}\n")
    return Int64(temp - 2)
}
