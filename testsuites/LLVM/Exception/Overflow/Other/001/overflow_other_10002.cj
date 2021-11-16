// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan -112success

@overflowWrapping
func test(a:Int8,b:Int8){
    return a*b
}

func main(){
    print("${test(100,4)}")
    var res = Int64(test(100,4) + 112)
    print("success")
    return res
}
