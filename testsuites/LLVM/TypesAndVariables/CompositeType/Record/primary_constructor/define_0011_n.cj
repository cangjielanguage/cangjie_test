// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


record Data {
  var a: Int32 = 1
  var b: Int32 = 2
  Data [] {}//EXPECTED: regex illegal record member in record block
}

func run(): Int64 {
  var value : Data = Data();
  if ((value.a == 3) &&  (value.b == 4)) {
    return 0
  }
  else {
    return 1
  }
}

func main(): Int64 {
  return run()
}

