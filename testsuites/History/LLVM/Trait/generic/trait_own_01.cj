// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 泛型类的类型变元限定于本身类
open class Day<T> where T<:Day<T> {
    var d: T
    init(x: T){
        d = x
    }
    static func foo<V>(x:V):V where V<:String{
        return x
    }
    static func boo<V>(x:V):V where V<:Day<V>{
        return x
    }
    static func coo<V>(x:V):V where V<:Day<T>{
        return x
    }
}

class Monday <: Day<Monday> {
   var d: Int32
   init(x: Int32){
       super(x)
       d = x
   }
}

func run(): Int64 {
    var v0: Int32 = 1
    var v1: Monday  = Monday(1)
    var v2: Day<Monday> = Day<Monday>(v1)
    var v3: String = Day<Monday>.foo<String>("a")
    var v4: Monday = Day<Monday>.boo<Monday>(v1)
    var v5: Monday = Day<Monday>.coo<Monday>(v1)
    if (v2.d.d != 1 || v3 != "a"  || v4.d != 1 || v5.d != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
     return run()
}

