// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 
open class A{
	
}

class B <: A{
	
}

class Data {
	var c = 0

  Data(let a!: A = A()) {

  }

  init(b!: B = B()){
    this.a = B()
  }
}

func run(): Int64 {
	return Data(a: B()).c
}

func main(): Int64 {
  return run()
}
