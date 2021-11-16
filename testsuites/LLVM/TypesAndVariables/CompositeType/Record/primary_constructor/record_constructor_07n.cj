// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

record Test {
    let a: Int32 = 1
    let b: Int32 = 2
    Test() {
      a = 3
      b = 4
    }
}

let res = Test(5)  //EXPECTED: regex no matching constructor for call 'Test'

