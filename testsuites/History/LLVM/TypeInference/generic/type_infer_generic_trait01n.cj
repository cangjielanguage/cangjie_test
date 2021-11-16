// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

trait TR1<K1, K2> { func foo1(a: This, b: K1, c: K2): K2 }

class Data<T>{
    var a:T
    init(x:T){ a = x }
}
append<V1, V2> Data<V1> with TR1<V1, V2> {
    func foo1(x: Data<V1>, y:V1, z:V2): V2{
        return z
    }
}


func test_trait(){
    var b:Int64 = foo1<Data<Int32>,Int32,Int64>(Data<Int64>(1),2,2) // EXPECTED: regex no matching constructor for call 'Data'
    var d:Int32 = foo1<Data<Int32>,Int32,Int64>(Data<Int32>(1),2,2) // EXPECTED: regex no matching function declaration for function call 'foo1'
}

func run():Int64{
    test_trait()
    return 0
}
func main(): Int64 {
    return run()
}