
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


package samePkgImport_01

import samePkgImport_01.A       // EXPECTED:regex error.*?package 'samePkgImport_01' should not import itself.

