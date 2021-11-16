// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan catch!
// ASSERT: scan func_test
// ASSERT: scan throwable_20005.cj:8

func test(){
    throw Exception("func_test")
}

func main() {
    var n = @{1,2,3}
    var res = 3
    try {
        test()
    }
    catch (e:Exception){print("catch!");e.printStackTrace()}
    finally {res = 0}
    return res
}
