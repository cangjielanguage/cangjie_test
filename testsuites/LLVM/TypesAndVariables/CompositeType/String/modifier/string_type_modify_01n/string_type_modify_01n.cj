// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %n.cj -c pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not Error
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkgs.string
