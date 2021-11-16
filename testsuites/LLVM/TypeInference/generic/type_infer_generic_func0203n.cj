// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

//泛型函数中对类型变元的使用是ArrayList<T>
func aoo<T>(x:ArrayList<T>):ArrayList<T>{
    var a = x
    return a
}
class Data<T>{
    var a:T
    init(x:T){ a = x }
}

func x(a:Int64):Int32{1}

func test_function_call(){
    var b = aoo<Int32>(ArrayList<Int32>(10,x))
    var e = aoo(ArrayList<Int32>(10,x))
    Data<ArrayList<Int64>>(b)  // EXPECTED: regex no matching constructor for call
}

func run():Int64{
    test_function_call()
    return 0
}
func main(): Int64 {
    return run()
}
