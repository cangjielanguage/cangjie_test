// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
  Data(var a : Bool) {
    this.a = a
  }
}

func run(): Int64 {
  var value : Data = Data(true);
  if (value.a) {
    return 0
  }
  return 1
}

func main(): Int64 {
  return run()
}

