// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


open external abstract class Parent { // EXPECTED: regex modifiers 'abstract' and 'open' are conflict in class declaration
private var field : Int32 = 1
}

class Child <: Parent {}

func main(): Int64 {
var child : Child = Child()
if (child.field != 1) { // EXPECTED: regex can not access field 'field'
return 1
}
return 0
