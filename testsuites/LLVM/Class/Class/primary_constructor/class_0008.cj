// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

abstract class Data {
  Data(var a!: Int32 = 1, var b!: Int32 = 2) {
    this.a = a
    this.b = b
  }
}

class Data2 <: Data{
  Data2(var aa!: Int32 = 3, var bb!: Int32 = 4) {
    this.a = aa
    this.b = bb
  }
}

func run(): Int64 {
  var value = Data2()
  return Int64(value.a - 3)
}

func main(): Int64 {
  return run()
}

