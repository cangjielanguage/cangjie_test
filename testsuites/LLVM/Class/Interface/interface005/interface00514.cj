// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface I1{
  static func f(){}
  interface I2 { // EXPECTED: regex interface type must be toplevel
    static func f(){}
  }
}

func main():Int64{
  I1.f()
  I1.I2.f()
  return 0
}
