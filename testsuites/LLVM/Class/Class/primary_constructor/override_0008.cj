// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 
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
	return Data(b: B()).c
}

func main(): Int64 {
  return run()
}
