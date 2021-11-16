// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


@overflowSaturating
func main(){
    var x : Int8 = 100
    var y : Int8 = 100
    var res = x+y
    print("success")
    return Int64(res) - 127
}
