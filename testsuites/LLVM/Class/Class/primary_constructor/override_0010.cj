// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A{}

class B{}

class Data {
	var c = 0

  Data(let a!: A = A()) {

  }

  init(b!: B = B()){
    this.a = A()
  }

  init(){
    this.a = A()
  }
}

func run(): Int64 {
	return Data().c//EXPECTED: regex ambiguous match for constructor call 'Data'
}

func main(): Int64 {
  return run()
}
