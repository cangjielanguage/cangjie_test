// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto no matching constructor for call
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

record Test {
    let a: Int32 = 1
    let b: Int32
    init() {
      b = 4
    }
}

let res = Test(5)

