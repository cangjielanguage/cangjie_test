// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt pkga.%middle %f  -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package pkg_issue_01
import pkga.*


// let a: Int32 = one

func main(): Int64 {
let a: Int32 = one
if (a != 1) {
return 1
}
return 0
}
