// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


interface A{
    @overflowSaturating
    func test(a:Int8,b:Int8){
        return a+b
    }
}

class B<: A{}


func main(){
    var res = Int64(B().test(127,100) - 127)
    print("success")
    return res
}
