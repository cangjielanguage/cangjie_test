// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    var one : Int32 = 1
}

class Data extend Base {
    var res = one
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
