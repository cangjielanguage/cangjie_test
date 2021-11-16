// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f

open class Base {
    var one : Int32 = 1
}

open class Base1 {
    var two : Int32 = 2
}

class Data <: Base & <: Base1 { //EXPECTED: regex-auto expected type
    var res = one
    var res1 = two
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
