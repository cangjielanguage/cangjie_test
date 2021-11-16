// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT regex initializer's type is incompatible with variable declaration 'res'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkgs

var res = pkgs
