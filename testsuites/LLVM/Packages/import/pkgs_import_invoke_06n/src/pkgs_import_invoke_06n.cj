// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt -c %f  -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto 'test' is not accessible in package 'pkgs'

import pkgs.test
