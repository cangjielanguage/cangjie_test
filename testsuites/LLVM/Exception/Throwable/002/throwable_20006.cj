// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan finally_in_test!catch!
// ASSERT: scan ArithmeticException
// ASSERT: scan throwable_20006.cj:9
func test(){
    var n = 2
    try{
        n = n / (n-2)
    }
    catch (e:Error){
        //e.printStackTrace()
    }
    finally{print("finally_in_test!")}
}

func main() {
    var n = @{1,2,3}
    var res = 3
    try {
        test()
    }
    catch (e:ArithmeticException){print("catch!");e.printStackTrace()}
    finally{res = 0}
    return res
}
