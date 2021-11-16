// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// class成员函数中使用父类成员变量a++
func main(): Int64 {
    return run()
}

open class Base{
    var base_a:Int32 = 2
}

class COO <: Base{
    var a: Int32 = 1
    var b: Int32 = 2
    func foo(x: Int32): Int32{
        super.base_a++
        this.a++
        return this.a + super.base_a
    }
}

func run(): Int64 {
    var coo: COO = COO()
    if (coo.foo(1) != 5) { return 1}
    return 0
}
