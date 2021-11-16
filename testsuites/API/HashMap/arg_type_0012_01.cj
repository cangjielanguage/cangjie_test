// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
class Data {
  Data(var a : HashMap<Bool, Bool>) {
    this.a = a
  }
}

func run(): Bool {
  var value : Data = Data( HashMap<Bool, Bool>([(true,true)]))
  return value.a[true]
}

func main(): Int64 {

  if (run()) {
   return 0
  };
  return 1
}

