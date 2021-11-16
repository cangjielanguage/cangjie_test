// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

abstract class Base {
func foo(): Int32
}

class Data <: Base {
override func foo(): Int32 { // EXPECTED: regex do not need 'override' modifier for function 'foo'
return 4
}
}
