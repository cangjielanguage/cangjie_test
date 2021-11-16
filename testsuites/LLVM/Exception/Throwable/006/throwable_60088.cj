
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex test
// ASSERT: scan throwable_60088.cj:13
func test(){
        
try{    
try{throw Throwable()}
finally{return 10}
}
finally{    
try{throw Throwable()}
finally{}
}

}


func main() {
    var res = test()
    print("success")
    return res - 10
}
