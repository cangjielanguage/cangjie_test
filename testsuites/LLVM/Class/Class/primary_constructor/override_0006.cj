// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {

  Data(let a!: Int32) {

  }

  init(){
    this.a = 9
  }
}

func run(): Int64 {

	return Int64(Data().a - 9)
}

func main(): Int64 {
  return run()
}
