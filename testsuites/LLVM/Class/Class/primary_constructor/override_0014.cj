// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data<D, C> {
  var a: Int32 = 1
  var b: Int32 = 2
  Data(a: C, b: Int32, c : Int32) {

  }

  init(a: C, b: Int32, c: Bool){

  }
}

func run(): Int64 {
  var a: Int32 = 8
  let b: Bool = false
return Int64(Data<Int32, Int32>(a,a,a).a - 1)
}

func main(): Int64 {
  return run()
}

