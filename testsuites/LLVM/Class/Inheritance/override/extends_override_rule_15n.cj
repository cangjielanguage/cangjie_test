// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
open func foo1(): Int32 {
return 3
}
}

class Data <: Base {
override func foo2(): Int32 { // EXPECTED: regex override function 'foo2' does not have an overridden function
return 4
}
}
