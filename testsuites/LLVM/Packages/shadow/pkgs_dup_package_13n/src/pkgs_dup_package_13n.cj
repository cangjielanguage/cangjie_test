// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle 2>&1 | compare %f
// ASSERT regex redefinition of declaration 'pkgs'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkgs

var res = pkgs
