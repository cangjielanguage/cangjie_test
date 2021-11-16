// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expected block begin with '{'



func main(){
    while (true) @overflowSaturating{
        var x : Int8 = 100
        var y : Int8 = 100
        var res = Int64(x+y)
        print("success")
        return res - 127
    }
}
