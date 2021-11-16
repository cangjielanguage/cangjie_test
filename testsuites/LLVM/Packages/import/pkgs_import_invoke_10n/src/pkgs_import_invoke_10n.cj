// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt -c %n.cj  pkgs.%middle -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkgs.*

var aa = pkgs.test // EXPECTED: regex 'test' is not a member of package 'pkgs'
