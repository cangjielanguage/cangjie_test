// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt -c src/pkgsa/pkgs1.cj src/pkgsa/pkgs2.cj -o pkgsa.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto redefinition of declaration 'one'
// ASSERT: regex-auto redefinition of declaration 'Foo'


