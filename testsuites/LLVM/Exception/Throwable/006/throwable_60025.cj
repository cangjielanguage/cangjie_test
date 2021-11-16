
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan acsuccess

func test(){
        
try{    
try{throw Throwable()}
finally{print("a");return 1}
}
catch (_){    
try{throw Throwable()}
catch (_){throw Throwable()}
finally{print("b");return 5} // will not print b.
}
finally{    
try{throw Throwable()}
catch (_){throw Throwable()}
finally{print("c");return 10}
}

}


func main() {
    var res = test()
    print("success")
    return res - 10
}
