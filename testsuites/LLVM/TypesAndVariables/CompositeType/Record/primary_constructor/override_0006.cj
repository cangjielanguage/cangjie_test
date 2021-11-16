// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

record Data {

  Data(let a!: Int32 = 0) {

  }

  init(){
    this.a = 9
  }
}

func run(): Int64 {
	return 0
}

func main(): Int64 {
  return run()
}
