// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException
// ASSERT: scan throwable_20011.cj:11
func main() {
    var a = ArrayList<Int64>([1,2,3])
    var res = 3


    try{
        a[res]
    }
    catch (e:Throwable){
        e.printStackTrace()
        return 0
    }
    finally{res = 0;return res}
    res = 4
    return res
}
