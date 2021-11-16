// DEPENDENCE: ../../../m4
// EXEC: %compiler %cmp_opt -c  %mod_opt m4 -o ./ 2>&1 | compare %f
// ASSERT: regex-auto package name supposed to be 'testcase'
// ASSERT: regex-auto package name supposed to be 'testcase.b'
