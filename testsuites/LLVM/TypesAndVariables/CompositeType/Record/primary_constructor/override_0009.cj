// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A{}

class B{}

record Data {
	var c = 0

  init(a: A){//EXPECTED: regex function 'init' has overload conflicts
  }
  Data(let a!: A = A()) {//EXPECTED: regex function 'init' has overload conflicts

  }

  init(b!: B = B()){
    this.a = A()
  }

  init(){
    this.a = A()
  }




}

func run(): Int64 {
	return Data(b: B()).c
}

func main(): Int64 {
  return run()
}
