
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan asuccess

func test(){
        
try{    
try{throw Throwable()}
finally{return 10}
}
finally{    
    print("a")
}

}


func main() {
    var res = test()
    print("success")
    return res - 10
}
