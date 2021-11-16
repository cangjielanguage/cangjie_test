// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

record Hi{
  Hi(let a: Int32){}
}

record Data {
  Data(var a : Hi) {
    this.a = a
  }
}

func run(): Bool {
  var value : Data = Data(Hi(5));
  return value.a.a == 5
}

func main(): Int64 {

  if (run()) {
   return 0
  };
  return 1
}

