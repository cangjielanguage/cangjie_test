// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex super class 'Base' is not inheritable, use 'open' modifier instead

external class Base {
    var one : Int32 = 1
}

class Data <: Base {
    var res = one
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
