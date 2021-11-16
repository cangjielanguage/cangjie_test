// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
open func foo(parm1: Int32, parm2: Int32, parm3: Int32): Int32 {
let ret = parm1 + parm2 + parm3 + 1
return ret
}
}

class Data <: Base {
func foo(parm1: Int32, parm2: Int32, parm3: Int32): Int32 { // EXPECTED: regex need 'override' modifier for function 'foo'
let ret = parm1 + parm2 + parm3 + 2
return ret
}
}
