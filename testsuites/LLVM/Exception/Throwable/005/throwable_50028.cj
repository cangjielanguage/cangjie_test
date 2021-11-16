// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

func test(){
    try{throw Exception()}
    catch(e:Exception){throw e}
    finally{return 10}
}


func main() {
    var res = test()
    print("success")
    return res - 10
}
