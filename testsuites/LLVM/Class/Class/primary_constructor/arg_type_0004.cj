// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
  Data(var a : Float64) {
    this.a = a
  }
}

func run(): Int64 {
  var value : Data = Data(3.0);
  if (value.a == 3.0) {
    return 0
  }
  return 1
}

func main(): Int64 {
  return run()
}

