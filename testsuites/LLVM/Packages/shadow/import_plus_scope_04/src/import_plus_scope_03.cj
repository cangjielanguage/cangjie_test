// DEPENDENCE: ../pkga ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c %pkg_opt pkga/src/pkga -o ./
// EXEC: %compiler %cmp_opt %f -import-config cfg-ast pkga.%middle -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex
//// EXEC: %run %run_opt %output %run_args

from "pkga" import pkga.*

func main(): Int64 {
if (pkga.a != 1) {
return 1
}
return 0
}
