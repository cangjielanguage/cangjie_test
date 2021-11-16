// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// record成员函数中使用函数成员变量b++
func main(): Int64 {
    return run()
}

record COO {
    var a: Int32 = 1
    var b: Int32 = 1
    func foo(x: Int32): Int32{
        var c = a+b+x
        c++
        return c
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
