// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


interface A{
    @overflowSaturating
    operator func +(x:Int64):Int8{
        var x : Int8 = 100
        var y : Int8 = 100
        return x+y
    }
}

class B<: A{}


func main(){
    var res = Int64((B()+1) - 127)
    print("success")
    return res
}
