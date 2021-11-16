// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    while (false) {
      var MyTuple = (
        1,
        class A{} // EXPECTED: regex expected expression here
     )
    }
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
