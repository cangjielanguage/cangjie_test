// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj src/pkga/pkga2.cj -o ./pkga.%middle 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?redefinition of declaration 'a'

import pkga.*

func main(): Int64 {
if (pkga.y != 2) {
return 1
}
return 0
}
