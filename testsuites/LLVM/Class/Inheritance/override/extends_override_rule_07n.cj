// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
open func foo(parm1: Sun): Int32 {
let ret = parm1.getFoo() + 1
return ret
}
}

class Data <: Base {
override func foo(parm1: Moon): Int32 { // EXPECTED: regex override function 'foo' does not have an overridden function
let ret = parm1.getFoo() + 2
return ret
}
}

open class Sun {
open func getFoo() {
return 2
}
}

class Moon <: Sun {
}
