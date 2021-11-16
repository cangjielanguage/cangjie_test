// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f  pkga.%middle -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import pkga

func main(): Int64 {
let a: Int32 = pkga.one
let b: Int32 = pkga.t.a
let c: pkga.Test // EXPECTED: regex undeclared type name 'Test'
return 0
}
