// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    var a = [1,2,3]
    var res = 3


    try{
        a[res-10]
    }
    catch (e:Throwable){
        e.printStackTrace()
        return res
    }
    finally{res = 0;return res}
    res = 4
    return res

}
