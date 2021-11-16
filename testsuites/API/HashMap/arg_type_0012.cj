// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
class Data {
  Data(var a : HashMap<Int32, Bool>) {
    this.a = a
  }
}

func run(): Bool {
  var value : Data = Data( HashMap<Int32, Bool>([(1,true),(2,false)]))
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

