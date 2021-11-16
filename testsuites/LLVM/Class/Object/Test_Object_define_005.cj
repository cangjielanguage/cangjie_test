// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto  unexpected symbol here, expected '<:' to inherit or '{' to open a scope

open class Object Object {}

class Date <: Object {
    var c: Int32
    init() {
        c = 1
    }
}

func main(): Int64 {

    var obj = Date()
    if (obj.c != 1) {
        return 1
    }

    return 0

}
