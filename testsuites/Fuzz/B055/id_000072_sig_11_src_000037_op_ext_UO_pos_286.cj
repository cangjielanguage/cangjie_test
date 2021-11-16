// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump


// Aegex-not core dumped

func main(): Int64 {

    func x(a:int64):Object{Object()}
    var myArray:ArrayList<Object> = ArrayList<Object>(5, x)

    if myArray.isEmpty(do{
    return 1
    }

    if myArray.size() != 5 {
        return 1
    }

    return 0

}
