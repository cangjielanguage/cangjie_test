// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
  Data(var a : Char) {
    this.a = a
  }
}

func run(): Int64 {
  var value : Data = Data('a');
  if (value.a == 'a') {
    return 0
  }
  return 1
}

func main(): Int64 {
  return run()
}

