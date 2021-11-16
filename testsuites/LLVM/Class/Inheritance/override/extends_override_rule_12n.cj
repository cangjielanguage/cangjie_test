// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
open func foo(parm1: Int32): Sun {
var obj = Sun()
obj.a = parm1 + 2
return obj
}
}

class Data <: Base {
func foo(parm1: Int32): Moon { // EXPECTED: regex need 'override' modifier for function 'foo'
var obj = Moon()
obj.a = parm1 + 3
return obj
}
}

open class Sun {
var a: Int32 = 2
}

class Moon <: Sun {
}
