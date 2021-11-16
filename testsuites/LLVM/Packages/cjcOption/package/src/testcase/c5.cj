// DEPENDENCE: ../testcase
// EXEC: %compiler %cmp_opt -c  testcase/a/a1.cj testcase/b/b1.cj -o ./out.%middle 2>&1 | compare %f
// ASSERT: regex package name supposed to be 'testcase.a'

package testcase
