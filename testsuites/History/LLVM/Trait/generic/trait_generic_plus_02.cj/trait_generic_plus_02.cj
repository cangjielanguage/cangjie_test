// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait TR<K1, K2> {
    func foo(a: This, input: Data<K1>): Data<K2>
}
class Cast {}

class Data<T>{}

append<K1, K2> Cast with TR<K1, K2> {
    func foo(op: Cast, input:Data<K1>): Data<K2>
    {
        var res: Data<K2> = Data<K2>()
        return res
    }
}
external func CastOp<T1, T2>(x: Data<T1>): Data<T2>
{
    var res = foo<Cast,T1,T2>(Cast(),x)
    var res2 = Cast().foo<Cast,T1,T2>(x) // test sugar
    return res
}



func run():Int64{
    var r1 = CastOp<Int32,String>(Data<Int32>()) // r1 = Data<String>()
    return 0
}


func main(): Int64 {
    return run()
}

