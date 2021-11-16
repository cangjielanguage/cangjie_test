// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success



extend Int64{
    @overflowSaturating
    operator func +(x:Float64):Int8{
        var x : Int8 = 100
        var y : Int8 = 100
        return x+y
    }
}


func main(){
    var res = Int64((1+1.0) - 127)
    print("success")
    return res
}
