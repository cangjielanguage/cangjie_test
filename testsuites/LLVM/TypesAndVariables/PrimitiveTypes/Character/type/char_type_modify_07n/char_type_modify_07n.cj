// DEPENDENCE: char_type_modify_07n_a.cj
// EXEC: %compiler %cmp_opt -c %n.cj char_type_modify_07n_a.cj -o %output 2>&1 | compare %f
// ASSERT: regex can not access field 'c'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package char_type_modify_07n

class B {
    var character: Char = A().c
}

func main(): Int64 {
    var b = B()
    return 0
}