// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan overflow in 'Addition' calculation

func test(a!:Int8=100+100):Int8{
    return a
}


func main(){
    var res = Int64(test() - 127)
    print("success")
    return res
}
