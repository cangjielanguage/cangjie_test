// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o ./pkga.%middle 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?redefinition of declaration 'pkga'

import pkga.*

func main(): Int64 {
if (pkga.pkga != 1) {
return 1
}
return 0
}
