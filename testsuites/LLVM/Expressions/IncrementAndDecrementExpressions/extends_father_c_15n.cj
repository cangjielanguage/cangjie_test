// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


public open class Outer {
open private abstract class Parent { // EXPECTED: regex modifiers 'abstract' and 'open' are conflict in class declaration
var field : Int32 = 1
}
class Child <: Parent {}
func main(): Int64 {
var child : Child = Child()
    field--
    field++
if (child.field != 1) {
return 1
}
return 0
}
}

