// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
class Data {
  Data(var a : HashSet<Bool>) {
    this.a = a
  }
}

func run() {
  var value : Data = Data(HashSet<Bool>([true]))
  return value.a.size()
}

func main(): Int64 {
  return run() - 1
}

