// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {

    func x(a:Int64):Object{Object()}
    var myArray:ArrayList<Object> = ArrayList<Object>(5, x)

    if (myArray.isEmpty()) {
        return 1
    }

    if (myArray.size() != 5) {
        return 1
    }

    return 0

}
