// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


record A{
    static var test = @overflowSaturating{a:Int8,b:Int8 => a+b}
}


func main(){
    var res = Int64(A.test(127,100) - 127)
    print("success")
    return res
}
