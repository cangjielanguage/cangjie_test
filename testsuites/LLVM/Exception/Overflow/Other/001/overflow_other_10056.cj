// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success

@overflowSaturating
@overflowSaturating
func test(a:Int8,b:Int8){
    return a+b
}

func main(){
    test(127,100)
    var res = Int64(test(127,100) - 127)
    print("success")
    return res
}
