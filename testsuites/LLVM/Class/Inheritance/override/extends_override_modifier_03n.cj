// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
open private func foo(): Int32 {
return 3
}
}

class Data <: Base {
override static func foo(): Int32 { // EXPECTED: regex modifiers 'static' and 'override' are conflict in function declaration
return 4
}
}
