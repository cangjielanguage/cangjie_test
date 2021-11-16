// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex error
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {

    func x(a:Int64):Object{Object()}
    var myArray:ArrayList<Object>try = ArrayList<Object>(5, x)

    if myArray.isEmpty() {
        return 1
    }

    if myArray.size() != 5 {
        return 1
    }

    return 0

}
