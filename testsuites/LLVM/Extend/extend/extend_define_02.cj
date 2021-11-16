// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-auto illegal object in toplevel

exten Int32{
    func plus(a: Int32, b: Int32): Int32 { a + b }
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
