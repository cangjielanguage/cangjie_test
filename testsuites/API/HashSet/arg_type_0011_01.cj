// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
class Data {
  Data(var a : HashSet<Bool>) {
    this.a = a
  }
}

func run(): Bool {
	var a =HashSet<Bool>([true])
  var value1 : Data = Data(HashSet<Bool>());
  var value : Data = Data(a);
  return value.a == a && value1.a.isEmpty()
}

func main(): Int64 {
  if (run()) {
   return 0
  }
  return 1
}

