
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan throwable_60042.cj:15
func test(){
        
try{return 1}
catch (_){    
try{throw Throwable()}
finally{return 5}
}
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
