// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Object {
    func f(): Int64 {
        return 1
    }
}

func main(): Int64 {
    var obj: Object = Object()

    if (obj.f() != 1) {
        return 1
    }

    return 0
}