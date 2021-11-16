// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex integer type is expected for start, stop and step in range expression
enum A{
  b(Int32)
}

func main(): Int64 {
    let a = A.b(1)..A.b(10):A.b(1)
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
