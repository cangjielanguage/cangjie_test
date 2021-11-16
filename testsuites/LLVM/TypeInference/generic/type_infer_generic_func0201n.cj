// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

//泛型函数中对类型变元的使用是T，调用时构造不匹配的场景
func aoo2<T>(x:T):T{
    var a = x
    return a
}
class Data<T>{
    var a:T
    init(x:T){ a = x }
}
func test_function_call(){
    var b = aoo2<Int32>(1) // 此处的1是int32
    Data<Int32>(b)
    var e = aoo2(1) // 此处的1是int64
    Data<Int64>(b) // EXPECTED: regex error.*?no matching constructor for call
    Data<Int32>(e) // EXPECTED: regex error.*?no matching constructor for call
}

func run():Int64{
    test_function_call()
    return 0
}
func main(): Int64 {
    return run()
}
