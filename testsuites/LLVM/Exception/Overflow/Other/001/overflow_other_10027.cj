// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success



@overflowSaturating
func test<T>():Int8{
    var a : Int8 = 127
    return a+a
}

func main(){
    var res = Int64(test<Int8>() - 127)
    print("success")
    return res
}
