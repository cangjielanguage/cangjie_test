// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
  Data(var a : Map<Int32, Bool>) {
    this.a = a
  }
}

func run(): Bool {
  var value : Data = Data( #{1: true, 2:false}  );
  match(value.a.get(1)){
    case Some(true) => true
    case Some(false) => false
    case None => false
  }
}

func main(): Int64 {

  if (run()) {
   return 0
  };
  return 1
}

