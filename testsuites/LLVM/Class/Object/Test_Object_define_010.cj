// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Object {
    var c: Int64 = 2
}

func main(): Int64 {

    var obj: Object = Object()

    if (obj.c != 2) {
        return 1
    }

    return 0
}