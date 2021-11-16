// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not success
// ASSERT: scan OverflowException

interface I{
    @overflowSaturating
    func test():Int8
}

class A <: I{
    func test():Int8{
        var x : Int8 = 100
        var y : Int8 = 100
        return x+y
    }
}


func main(){
    var res = Int64((A().test()) - 127)
    print("success")
    return res
}
