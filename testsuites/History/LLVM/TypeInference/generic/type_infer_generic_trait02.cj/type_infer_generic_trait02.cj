// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC： %run %run_opt %output %run_args


//泛型trait中对类型变元的使用是T/Array<T>/ArrayList<T>/(T)->T/T*T
trait TR1<K1, K2> { func aoo1(a: This, b: K1, c: K2): K2 }
trait TR2<K1, K2> { func aoo2(a: This, b: K1, c: K2[]): K2[] }
// trait TR3<K1, K2> { func aoo3(a: This, b: K1, c: ArrayList<K2>): ArrayList<K2> } // 见独立用例type_infer_generic_trait0203.cj
trait TR4<K1, K2> { func aoo4(a: This, b: K1, c: (K2)->K2): (K2)->K2 }
trait TR5<K1, K2> { func aoo5(a: This, b: K1, c: K2*K2): K2*K2 }

class Data<T>{
    var a:T
    init(x:T){ a = x }
}
append<V1, V2> Data<V1> with TR1<V1, V2> {
    func aoo1(x: Data<V1>, y:V1, z:V2): V2{
        return z
    }
}
append<V1, V2> Data<V1> with TR2<V1, V2> {
    func aoo2(x: Data<V1>, y:V1, z:V2[]): V2[]{
        return z
    }
}

//append<V1, V2> Data<V1> with TR3<V1, V2> {
//    func aoo3(x: Data<V1>, y:V1, z:ArrayList<V2>): ArrayList<V2>{
//        return z
//    }
//}

append<V1, V2> Data<V1> with TR4<V1, V2> {
    func aoo4(x: Data<V1>, y:V1, z:(V2)->V2): (V2)->V2{
        return z
    }
}

append<V1, V2> Data<V1> with TR5<V1, V2> {
    func aoo5(x: Data<V1>, y:V1, z:V2*V2): V2*V2{
        return z
    }
}

class Time<T>{
    var a:T
    init(x:T){ a = x }
}
//B103中append中This语法糖尚未实现
//append<V1, V2> Time<V1> with TR1<V1, V2> {
//    func foo1(x: This, y:V1, z:V2): V2{
//        return z
//    }
//}

func test_trait(){
    var a:Int64 = aoo1<Data<Int32>,Int32,Int64>(Data<Int32>(1),2,2) // ok
    var a0:Int32 = 1
    var b = aoo2<Data<Int32>,Int32,Int32>(Data<Int32>(1),2,@{a0,a0})
//    var e = aoo2(Data<Int32>(1),2,@{a0,a0})
    var d = aoo2<Data<Int32>,Int32,Int32>(Data<Int32>(1),2,[a0,a0].toArray())
    Data<Array<Int32>>(b)
    Data<Array<Int32>>(d)

//    var b3 = aoo3<Data<Int32>,Int32,Int32>(Data<Int32>(1),2,ArrayList<Int32>(10,x))
//    var e3 = aoo3(Data<Int32>(1),2,ArrayList<Int32>(10,x))
//    Data<ArrayList<Int32>>(b3)
//    Data<ArrayList<Int32>>(e3)

    var b4 = aoo4<Data<Int32>,Int32,Int32>(Data<Int32>(1),2, { x:Int32 => 1}) // ok
    Data<(Int32)->Int32>(b4)
    //var e4 = aoo4(Data<Int32>(1),2, { x:Int32 => 1}) // B010普通函数可以，但TraitFunc却不行
    //Data<(Int32)->Int32>(e4)

    var b0:Int32*Int32 = (1,2)
    var b5 = aoo5<Data<Int32>,Int32,Int32>(Data<Int32>(1),2,b0)
    Data<Int32*Int32>(b5)
    //var e5 = aoo5(Data<Int32>(1),2,(1,2))
    //Data<Int32*Int32>(e5)

}

func run():Int64{
    test_trait()
    return 0
}
func main(): Int64 {
    return run()
}

