// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC： %run %run_opt %output %run_args

trait TR1<K1, K2> {
    func foo1(a: This, b: K1, c: K2): K2 // func foo1<T , k1, k2> (a : T, b: k1, c : k2) where T <: TR1<k1, k2>
    func foo2(c:K2):K2 // func foo2<V2> (c: V2)
    }

class Data<T>{
    var a:T
    init(x:T){ a = x }
}
append<V1, V2> Data<V1> with TR1<V1, V2> {
    func foo1(x: Data<V1>, y:V1, z:V2): V2{
        return z
    }
    func foo2(z:V2):V2{return z}
}
class Time<T>{
    var a:T
    init(x:T){ a = x }
}

func foo3(x: Data<Int32>, y:Int32, z:Int32): Int32{
    return z
}
func foo4(z:Int32): Int32{
    return z
}

func test_trait(){
    var b:Int64 = foo1<Data<Int32>,Int32,Int64>(Data<Int32>(1),2,2) // ok
    var a = foo1<Data<Int32>,Int32,Int64>(Data<Int32>(1),2,2) // ok
//    var e = foo1(Data<Int32>(1),2,2) // traitFunc: no match  issue
//    var h = foo2(3) // traitFunc:no motch 对，foo2 推导不出this类型，然后默认推成unit， Unit 没有<: TR
    var g = foo3(Data<Int32>(1),2,2)  // ok
    var m = foo4(4) // ok
//    var c:Int64 = foo1<Data<Int32>,Int32,Int64>(Data<Int32>(1),2,2) // ok
}

func run():Int64{
    test_trait()
    return 0
}
func main(): Int64 {
    return run()
}

