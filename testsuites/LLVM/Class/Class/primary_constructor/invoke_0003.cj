// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Data{
  Data(var a!: Data = Data()){ // EXPECTED: regex recursive constructor calling in class 'Data'

  }
}

func main(): Int64 {
  var a: Data = Data()
  return 0
}

