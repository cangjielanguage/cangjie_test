// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex illegal interface member in interface block
interface MyInterface{
trait Num {
    func plus(a: This, b: This): This
}

append Int32 with Num {
    func plus(a: Int32, b: Int32): Int32 { a + b }
}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
