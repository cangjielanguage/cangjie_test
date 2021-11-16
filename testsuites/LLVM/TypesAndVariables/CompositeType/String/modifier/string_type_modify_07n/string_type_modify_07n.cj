// DEPENDENCE: string_type_modify_07n_a.cj
// EXEC: %compiler %cmp_opt -c %n.cj string_type_modify_07n_a.cj -o %output 2>&1 | compare %f
// ASSERT: regex can not access field 'str'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package string_type_modify_07n

class B {
    var str: String = A().str
}

func main(): Int64 {
    var b = B()
    return 0
}