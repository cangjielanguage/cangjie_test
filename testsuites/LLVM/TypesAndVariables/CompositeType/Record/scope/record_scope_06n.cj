// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto class 'TestClass' can only inherit a class
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
   let a: Int32 = 0
   var b: Int32 = 0
}

class TestClass <: Test {}
