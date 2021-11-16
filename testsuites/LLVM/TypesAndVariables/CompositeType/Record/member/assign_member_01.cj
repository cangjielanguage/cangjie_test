// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

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

let test = Test()

func run(): Int64 {
  test.a = 1   // EXPECTED: regex is an initialized 'let' constant
  test.b = 1   // EXPECTED: regex is an initialized 'let' constant
  test.foo = { // EXPECTED: regex is an initialized 'let' constant
    return 0
  }
  return 1
}

func main(): Int64 {
  return run()
}

