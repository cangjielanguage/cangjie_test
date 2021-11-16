// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {

  Data(let a: Int32) {//EXPECTED: regex function 'init' has overload conflicts

  }

  init(a: Int32){//EXPECTED: regex function 'init' has overload conflicts

  }
}

func run(): Int64 {
return 0
}

func main(): Int64 {
  return run()
}

