// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex variable 'i' in interface should be immutable, use 'let' instead of 'var'
// ASSERT: regex variable 'i' in interface should have initializer
interface MyInterface{
  var i : Int32
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
