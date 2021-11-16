// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex do not need 'override' modifier for function 'foo'

abstract class Base {
func foo(): Int32
}

abstract class Data <: Base {
override func foo(): Int32 // EXPECTED: regex do not need 'override' modifier for function 'foo'
}
