// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

record Data {
  var a: Int32 = 1
  var b: Int32 = 2
  Data() {
    a = 3
    b = 4
  }
}

func run(): Int64 {
  var value : Data = Data();
  if ((value.a == 3) &&  (value.b == 4)) {
    return 0
  }
  else {
    return 1
  }
}

func main(): Int64 {
  return run()
}

