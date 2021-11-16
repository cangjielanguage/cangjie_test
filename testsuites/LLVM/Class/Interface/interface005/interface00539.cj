// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'F0'
interface I0{
  func F0()
}

func main():Int64{
  var a = F0()
  return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
