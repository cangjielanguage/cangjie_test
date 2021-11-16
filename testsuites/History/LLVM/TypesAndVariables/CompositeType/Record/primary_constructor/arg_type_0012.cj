// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
  Data(var a : Map<Bool, Bool>) {
    this.a = a
  }
}

func run(): Bool {
  var value : Data = Data(#{true: true});
  return value.a[true]
}

func main(): Int64 {

  if (run()) {
   return 0
  };
  return 1
}

