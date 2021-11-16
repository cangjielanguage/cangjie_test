// EXEC: %compiler %cmp_opt  %f -o %output

class Data {
  Data(){

  }
  var b = Data()
  // compile success, run core dump
}


func run(): Int64 {
  var value = Data()
  return 0
}

func main(): Int64 {
  return run()
}

