// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs/pkgs.%middle
// EXEC: %compiler %cmp_opt %n.cj  pkgs/pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import pkgs.Data // EXCEPED: regex package 'pkgs.Data' is not found

