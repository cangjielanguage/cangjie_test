// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
open func foo(parm1: Int32): Moon {
var obj = Moon()
obj.a = parm1 + 2
return obj
}
}

class Data <: Base {
func foo(parm1: Int32): Sun { // EXPECTED: regex The return type of the override/redefine/implement function must be the same as or a subtype of the overridden/redefined/implemented function
var obj = Sun()
obj.a = parm1 + 3
return obj
}
}

open class Sun {
var a: Int32 = 2
}

class Moon <: Sun {
}
