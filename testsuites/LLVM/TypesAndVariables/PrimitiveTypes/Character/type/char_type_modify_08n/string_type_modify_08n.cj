// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex can not access field 'c'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package char_type_modify_08n

class A {
    protected var c: Char = 'a'
}

class B {
    var character: Char = A().c
}
func main(): Int64{
    var b = B()
}