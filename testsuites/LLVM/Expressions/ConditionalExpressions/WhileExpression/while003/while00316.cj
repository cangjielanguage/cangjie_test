// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{
  var a: Int32 = 1
  func test():Int32{
    var b = 10
    while (b != 0) {
      b = b - 1
    }
    return 0
  }
}

func main(): Int64 {
//    print("start")
    var b = 10
    while (b != 0) {
      b = b - 1
    }
//    print("while in func ok")

    var a = A()
    a.test()
//    print("while in class ok")
    return 0
}
