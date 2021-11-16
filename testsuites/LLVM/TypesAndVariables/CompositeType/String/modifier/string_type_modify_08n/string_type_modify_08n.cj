// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex can not access field 'str'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package string_type_modify_08n

class A {
    protected var str: String = "Hello Char Lang"
}

class B {
    var str: String = A().str
}
func main(): Int64{
    var b = B()
}