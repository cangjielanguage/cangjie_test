// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler  %cmp_opt %pkg_opt ./src/pkga -c -o ./ 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan package 'pkga' should not import itself

import pkga.*

func main(): Int64 {
let a: Int32 = pkga.one
if (a != 1) {
return 1
}
return 0
}
