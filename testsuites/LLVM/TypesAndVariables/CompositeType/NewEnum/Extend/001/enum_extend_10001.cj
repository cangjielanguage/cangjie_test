// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a
}

extend A{
  func test(){0}
}

func main(): Int64 {
    var i = A.a
    return i.test()
}
