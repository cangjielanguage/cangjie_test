// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

//  泛型trait中的类型变元限定为自身trait，append时泛型trait的类型变元是append的类型本身（非泛型）
record GoodStudent {
    var s: Int32
    init(x: Int32){
       s = x
    }
}

trait Num<V> where V<:Num<V> {
    func chooseOne(a: This, b: V): This
}

append GoodStudent with Num<GoodStudent> {
    func chooseOne(a: GoodStudent, b: GoodStudent): GoodStudent { return a }
}

func run(): Int64 {
    var u0:Int32 = 1
    var u1:GoodStudent = GoodStudent(u0)
    let y: GoodStudent = chooseOne(u1,u1)
    if (y.s != 1){
        return 1
    }
    return 0
}

func main(): Int64 {
     return run()
}

