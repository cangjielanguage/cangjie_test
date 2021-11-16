// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data <T>{
  Data(var a : T ) {
    this.a = a
  }
}

func run(): Bool {
  let b:Int32 = 9
  var value  = Data<Int32>( b );
  return value.a == b
}

func main(): Int64 {

  if (run()) {
   return 0
  };
  return 1
}
