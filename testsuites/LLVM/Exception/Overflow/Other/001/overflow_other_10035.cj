// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


class A{
    @overflowSaturating
    operator func +(x:Int64):Int8{
        var x : Int8 = 100
        var y : Int8 = 100
        return x+y
    }
}


func main(){
    var res = Int64((A()+1) - 127)
    print("success")
    return res
}
