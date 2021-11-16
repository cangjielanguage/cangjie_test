// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump

func main(): int64 {

    func x(a:int64):Object{Object(do
    var myArray:ArrayList<Object> = ArrayList<Object>(5, x)

    if myArray.isEmpty() {
    return 1
    }

    if myArray.size() != 5 {
        return 1
    }

    return 0

}
