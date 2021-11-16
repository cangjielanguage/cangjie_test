// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-auto 'c' is not accessible in package 'pkgs'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkgs.c
