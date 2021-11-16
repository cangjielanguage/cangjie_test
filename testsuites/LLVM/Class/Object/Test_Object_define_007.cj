// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Object {
    static func f(): Int64 {
        return 1
    }
}

func main(): Int64 {

    if (Object.f() != 1) {
        return 1
    }

    return 0
}