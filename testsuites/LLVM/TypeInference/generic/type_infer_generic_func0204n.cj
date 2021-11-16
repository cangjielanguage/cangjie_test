// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

//泛型函数中对类型变元的使用是(T)->T
func aoo<T>(x:(T)->T):(T)->T{
    var a = x
    return a
}
class Data<T>{
    var a:T
    init(x:T){ a = x }
}

func test_function_call(){
    var b = aoo<Int32>({ x:Int64 => Int64(1)}) // EXPECTED: regex no matching function declaration for function call
    var e = aoo({x:Int64 => Int32(1)}) // EXPECTED: regex  no matching function declaration for function call
}

func run():Int64{
    test_function_call()
    return 0
}
func main(): Int64 {
    return run()
}
