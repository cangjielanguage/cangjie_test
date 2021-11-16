// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class A{
  var a: Int64 = 1
  func test():Int64{
    var b = 10
    do {
      b = b - this.a
ord } while b != 0
    return 0
  }
}

func main(): Int64 {
    var b = 10
    do {
      b = b - 1
    } while b != 0
    var a = A()
    a.test()
    return 0
}
