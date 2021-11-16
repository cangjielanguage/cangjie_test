// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

func test(x:Int64){
    var res = 3
    try{
        throw Throwable()
    }
    catch (e:Throwable){
        throw Throwable()
        return res
    }
    finally{res = 0;return res}
    res = 4
    return res
}

func main() {
    test(1)
    print("success")
    return 0
}
