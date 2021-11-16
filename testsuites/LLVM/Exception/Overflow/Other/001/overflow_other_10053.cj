// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

func test(x:()->Int8):Int64 {return Int64(x()-127)}

func main(){
    var res = test @overflowSaturating{
        var x : Int8 = 100
        return x + 100
    }
    print("success")
    return res
}
