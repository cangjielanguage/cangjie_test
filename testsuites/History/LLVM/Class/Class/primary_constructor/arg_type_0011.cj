// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
  Data(var a : Set<Bool>) {
    this.a = a
  }
}

func run() {
  var value : Data = Data( #{true}  );
  return value.a.size()
}

func main(): Int64 {
  return run() - 1
}

