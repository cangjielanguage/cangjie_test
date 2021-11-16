// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto expected type

open class Base {
    var one : Int32 = 1
}

class Data <: {
    var res = one
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
