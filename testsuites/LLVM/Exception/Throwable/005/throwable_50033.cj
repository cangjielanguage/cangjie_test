// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

func test(){
    try{return 5}
    finally{
       try{}
       catch(_){}
       finally{}
    }
}


func main() {
    var res = test()
    print("success")
    return res - 5
}
