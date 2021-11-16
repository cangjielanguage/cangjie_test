// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record Test {
  let a: Int32 = 0
  var b: Int32 = 0
  static var b2: Int32 = 0
  func foo(): Int32 {
    return a
  }

  static func foo1(): Int32 {
    return 0
  }

}

var test = Test()

func a(): Int32{
  return 5
}

func run(): Int64 {
  test.b = 1
  test.foo = a // EXPECTED: regex 'func' can not be assigned
  return Int64(test.b + test.foo() - 6)
}

func main(): Int64 {
  return run()
}

