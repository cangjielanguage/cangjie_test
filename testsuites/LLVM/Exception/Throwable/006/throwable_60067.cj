
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

func test(){
        
try{    
try{throw Throwable()}
catch (_){throw Throwable()}
finally{return 10}
}
catch (_){
return 5
}

}


func main() {
    var res = test()
    print("success")
    return res - 10
}
