// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

enum MyEnum{
  MyEnum( var a: Float32)
}

enum MyEnum2{
  MyEnum2(let b: Float32)
}

func run(): Int64 {
  let time1 = MyEnum.MyEnum(3.0)
  return 0
}

func main(): Int64 {
  return run()
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
