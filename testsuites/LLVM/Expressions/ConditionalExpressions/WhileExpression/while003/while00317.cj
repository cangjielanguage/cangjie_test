// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{
    var a = 1
}

class B <: A{
    func test():Int64{
      var a = super.a
      return 0
    }
}

func main(): Int64 {
    while (true) {
        var b = B()
        return b.test()
    }
    return 1
}
