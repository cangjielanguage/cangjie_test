
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

func test(){
try{
    try{}
    catch (_){}
    finally{
    try{throw Throwable()}
    catch (_){throw Throwable()}
    }
    return 1
}
catch(_:Throwable){
    return 5
}
finally{
    return 10
}


}


func main() {
    var res = test()
    print("success")
    return res - 10
}
