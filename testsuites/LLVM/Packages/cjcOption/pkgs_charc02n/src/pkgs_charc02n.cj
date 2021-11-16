// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt -c src/pkgsa/pkgsa.cj src/pkgsc/pkgsc.cj -o pkgsa.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto package name supposed to be

