// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Object {
    static var c: Int64 = 2
}

func main(): Int64 {
    if (Object.c != 2) {
        return 1
    }

    return 0
}