// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

//泛型函数中对类型变元的使用是数组T[]
func aoo2<T>(x:Array<T>):Array<T>{
    var a = x
    return a
}
class Data<T>{
    var a:T
    init(x:T){ a = x }
}
func test_function_call(){
    var a0:Int32 = 1
    [a0,a0].toArray()
    var b = aoo2<Int32>(@{a0,a0})
    var d = aoo2<Int32>([a0,a0].toArray())
    Data<Array<Int32>>(b)
    Data<Array<Int32>>(d)
    var e = aoo2(@{a0,a0})
    var f = aoo2([a0,a0].toArray())
    Data<Array<Int32>>(e)
    Data<Array<Int32>>(f)
//    Data(b) // 此处B103无法推断
//    Data(d) // 此处B103无法推断
}

func run():Int64{
    test_function_call()
    return 0
}
func main(): Int64 {
    return run()
}
