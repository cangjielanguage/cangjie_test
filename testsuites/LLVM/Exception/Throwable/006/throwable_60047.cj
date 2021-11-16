
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

func test(){
        
try{}
catch (_){}
finally{
    try{throw Throwable()}
    finally{return 10}
}
return 1
}


func main() {
    var res = test()
    print("success")
    return res - 10
}
