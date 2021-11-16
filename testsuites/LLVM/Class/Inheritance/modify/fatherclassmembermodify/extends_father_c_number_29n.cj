// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


open class Parent {
open private class Inner {
static var field : Int32 = 1
}
}

class Child <: Parent {}

func main(): Int64 {
if (Child.Inner.field != 1) { // EXPECTED: regex can not access field 'Inner'
return 1
}
return 0
}
