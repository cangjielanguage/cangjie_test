// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// class成员函数中使用类变量this.b++
func main(): Int64 {
    return run()
}

class COO {
    var a: Int32 = 1
    var b: Int32 = 2
    func foo(x: Int32): Int32{
        this.b = 1
        this.b++
        return this.a + this.b + x
    }
}

func run(): Int64 {
    var coo: COO = COO()
    var res1: Int32 = coo.foo(1)
    if(res1 == 4){
        return 0
    }
    return 1
}
