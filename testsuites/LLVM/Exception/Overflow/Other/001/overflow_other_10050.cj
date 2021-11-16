// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


@overflowSaturating
func main(){
    var test = {
        var x : Int8 = 100
        var y : Int8 = 100
        var res = Int64(x+y)
        print("success")
        return res - 127
    }
    return test()
}
