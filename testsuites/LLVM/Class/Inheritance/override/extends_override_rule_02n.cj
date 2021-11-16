// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto need 'override' modifier for function 'foo'

open class Base {
open func foo(): Int32 {
return 3
}
}

class Data <: Base {
func foo(): Int32 {
return 4
}
}
