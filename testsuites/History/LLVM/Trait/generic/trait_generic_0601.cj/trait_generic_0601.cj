// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 泛型trait中的类型变元限定为自身trait，append时泛型trait的类型变元使用非泛型（Int32/自定义类型）
record GoodStudent {
    var s: Int32
    init(x: Int32){
       s = x
    }
}

trait Num<V> where V<:Num<V> {
    func chooseOne(a: This, b: V): This
}

append GoodStudent with Num<Int32> {
    func chooseOne(a: GoodStudent, b: Int32): GoodStudent { return a}
}

append Int32 with Num<Int32>{
    func chooseOne(a: Int32, b: Int32): Int32 { return a}
}

func run(): Int64 {
    var v0:Int32 = 1
    var v1:Int32 = 2
    var v2:GoodStudent = GoodStudent(v0)
    let x:GoodStudent = chooseOne(v2,v1)
    var u0:Int32 = 1
    var u1:Int32 = 2
    let y:Int32 = chooseOne(u0,u1)
    if(y != 1 || x.s != 1){
        return 1
    }
    return 0
}

func main(): Int64 {
     return run()
}

