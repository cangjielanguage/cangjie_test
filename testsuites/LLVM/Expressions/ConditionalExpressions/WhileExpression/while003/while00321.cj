// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    var a : Int32
    init(){
        this.a = 1
    }
    func test():Int32{
        while (true) {
          A()
          return 1
        }
        return 1
    }
}


func main(): Int64 {
    while (true) {
        var a = A()
        a.test()
        return 0
    }
    return 1
}
