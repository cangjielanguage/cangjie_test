// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex can not access field 'str'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
package pkgs

class A {
    protected var str: String = "Hello Char Lang"
}

class B {
    var str: String = A().str
}
func main(): Int64{
    var b = B()
}