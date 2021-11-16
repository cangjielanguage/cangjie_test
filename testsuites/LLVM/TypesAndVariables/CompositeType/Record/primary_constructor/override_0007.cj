// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {

  Data(let a!: Int32 = 0) {

  }

  init(){
    this.a = 9
  }
}

func run(): Int64 {
	return Data().a //EXPECTED: regex ambiguous match for constructor call 'Data'
}

func main(): Int64 {
  return run()
}
