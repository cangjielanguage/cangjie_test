// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Test {
    func foo(): Int32{
      return 1
    }
    let b: () -> Int32 = foo  // EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized
}

