// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
  var a: Int32 = 1
  var b: Int32 = 2
  // this is a normal func
  func Data() {
    a = 3
    b = 4
  }
}

func run(): Int64 {
  var value : Data = Data();
  if ((value.a == 1) &&  (value.b == 2)) {
    return 0
  }
  else {
    return 1
  }
}

func main(): Int64 {
  return run()
}

