// DEPENDENCE: ../src ../cfg-asta ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o ./pkga.%middle
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj pkga.%middle  -o ./pkgb.%middle
:wq// EXEC: %compiler %cmp_opt %n.cj  pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import pkga.*
import pkgb.*

func run(): Int64 {
let z: Int64 = aoo() // EXPECTED: regex error: ambiguous match for function call
return 0
}

func main(): Int64 {
return run()
}
