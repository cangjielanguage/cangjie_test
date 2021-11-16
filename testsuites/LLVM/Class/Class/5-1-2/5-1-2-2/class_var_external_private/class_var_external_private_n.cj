// DEPENDENCE: pkg cfg-ast
// EXEC: %compiler %cmp_opt -c pkg/pkg.cj -o pkg/pkg.%middle
// EXEC: %compiler %cmp_opt -c %n.cj -i cfg-ast -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto can not access field 'a'

package class_var_external_default

import pkg.*

func main(): Int64 {
    let a = pkg.Data().a
    if (a != 1) {
        return 1
    }
    return 0
}
