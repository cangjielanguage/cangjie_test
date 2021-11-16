
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan throwable_60010.cj:23
func test(){
        
try{    
    try{throw Throwable()}
    catch (_){throw Throwable()}
    finally{return 10}
}
catch (_){return 5}
finally{    
try{throw Throwable()}
catch (_){throw Throwable()}
}

}


func main() {
    var res = test()
    print("success")
    return res - 10
}
