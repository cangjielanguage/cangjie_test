// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record Test {
  func foo(): Int32 {
    return 0
  }

  static func foo1(): Int32 {
    return 0
  }
}



func a(): Int32{
  return 5
}

class A{
  func foo(): Int32 {
    return 1
  }

  static func foo1(): Int32 {
    return 0
  }
}


func run(): Int64 {
  var test = Test()
  var testA = A()

  test.foo = a // EXPECTED: regex 'func' can not be assigned
  Test.foo1 = a  // EXPECTED: regex 'func' can not be assigned
  testA.foo = a  // EXPECTED: regex 'func' can not be assigned
  A.foo1 = a  // EXPECTED: regex 'func' can not be assigned
  return 0
}

func main(): Int64 {
  return run()
}


