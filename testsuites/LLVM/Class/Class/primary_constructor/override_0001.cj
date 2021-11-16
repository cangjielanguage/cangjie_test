// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
  var a: Int32 = 1
  var b: Int32 = 2
  Data() {//EXPECTED: regex function 'init' has overload conflicts
    a = 3
    b = 4
  }

  init(){//EXPECTED: regex function 'init' has overload conflicts

  }
}

func run(): Int64 {
return 0
}

func main(): Int64 {
  return run()
}

