// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
  Data(var a : Set<Bool>) {
    this.a = a
  }
}

func run(): Bool {
	var a = #{true}
  var value1 : Data = Data(Set<Bool>());
  var value : Data = Data(a);
  return value.a == a && value1.a.isEmpty()
}

func main(): Int64 {
  if (run()) {
   return 0
  }
  return 1
}

