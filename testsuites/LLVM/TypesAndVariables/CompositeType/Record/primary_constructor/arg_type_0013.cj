// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

record Data {
  Data(var a : (Int32*Bool)) {
    this.a = a
  }
}

func run(): Bool {
  var value : Data = Data((1, true));
  return value.a[1] && value.a[0] == 1
}

func main(): Int64 {

  if (run()) {
   return 0
  };
  return 1
}

