// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
open public func foo(): Int32 {
return 3
}
}

class Data <: Base {
public func foo(): Int32 { // EXPECTED: regex need 'override' modifier for function 'foo'
return 4
}
}
