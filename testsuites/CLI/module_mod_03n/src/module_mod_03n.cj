// DEPENDENCE: ../../module_mod_03n
// EXEC: %compiler %cmp_opt %mod_opt %n -o ./ 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex entry function 'main' is missing
