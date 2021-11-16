// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 变量赋值,泛型类中对类型变元的使用是T
func test_class(){
    var a:Data<Int32> = Data<Int32>(1)
//    var b:Data<Int64>  = Data(1) // B103尚未支持泛型类的类型变元省略的访问模式
    var c = Data<Int32>(1)
    var d = Data<Int32>(c.a)
    var e = Data<Data<Int32>>(c)
}

class Data<T>{
    var a:T
    init(x:T){ a = x }
}

func run():Int64{
    test_class()
    return 0
}
func main(): Int64 {
    return run()
}


