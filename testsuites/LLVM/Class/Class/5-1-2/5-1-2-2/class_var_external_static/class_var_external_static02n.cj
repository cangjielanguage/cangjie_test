// DEPENDENCE: pkg cfg-ast
// EXEC: %compiler %cmp_opt -c pkg/pkg.cj -o pkg/pkg.%middle
// EXEC: %compiler %cmp_opt -c %n.cj -i  cfg-ast -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package class_var_external_static

import pkg.*

let b = pkg.Data().a // EXPECTED: regex object cannot access static member 'a'
