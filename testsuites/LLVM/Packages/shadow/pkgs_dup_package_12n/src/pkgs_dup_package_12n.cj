// DEPENDENCE: ../src ../cfg-ast
// ERRCHECK: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// ASSERT: scan redefinition of declaration 'pkgs'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkgs

var res = pkgs
