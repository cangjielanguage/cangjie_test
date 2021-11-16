// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

record Data {
  Data(var a : String) {
    this.a = a
  }
}

func run(): Int64 {
  var value : Data = Data("");
  if (value.a == "") {
    return 0
  }
  return 1
}

func main(): Int64 {
  return run()
}

