// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var sum1: (Int32, Int32) -> Int32 = {a, b => a + b}
var sum2: (Int32, Int32) -> Int32 = {a: Int32, b => a + b}
func f(a1: (Int64)->Int64): Int64 {
    a1(1)
}
func main(): Int64 {
    f({a2 => a2 - 1 }) // lambda 的参数类型根据其使用处所在函数调用的形参类型推断
}
