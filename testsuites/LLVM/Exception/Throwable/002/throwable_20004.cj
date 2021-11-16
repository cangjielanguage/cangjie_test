// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan f!f!f!catch!
// ASSERT: regex catch!java.lang.ArithmeticException: / by zero|Exception RuntimeException ArithmeticException Divided by zero
// ASSERT: scan throwable_20004.cj:12
func test(){
    var i : Int64 = 0
    var n = @{1,2,3,4,5}

    while (i <= 4){
        try{
            n[i] = 10/(i-2)
        }
        catch (e:Error){
            //e.printStackTrace()
        }
        finally{
            i++
            print("f!") // should print 3*f!
        }
    }
}

func main() {
    var n = @{1,2,3}
    var res = 3
    try {
        test()
    }
    catch (e:ArithmeticException){print("catch!");e.printStackTrace();res = 0}
    return res
}
