// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex can not access field 'one'

package class_var_abstract_private

class Data <: Base {
    var res = one
}
