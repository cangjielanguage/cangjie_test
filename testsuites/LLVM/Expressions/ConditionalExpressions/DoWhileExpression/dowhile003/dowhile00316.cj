// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{
  var a: Int64 = 1
  func test():Int64{
    var b = 10
    do {
      b = b - this.a
    } while (b != 0)
    return 0
  }
}

func main(): Int64 {
    var b = 10
    do {
      b = b - 1
    } while (b != 0)
    var a = A()
    a.test()
    return 0
}
