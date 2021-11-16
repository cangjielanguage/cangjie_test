// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 泛型函数的类型变元，限定于本身所在类
open class Day<T> {
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
       d = x
   }
}

class Tuesday <: Day<Int32> {
   var d: Int32
   init(x: Int32){
       d = x
   }
}

func run(): Int64 {
    var v0: Int32 = 1
    var day1: Monday = Monday(1)
    var day2: Tuesday = Tuesday(2)
    var v1: Day<Monday> = Day<Monday>(day1)
    var v2: Day<Tuesday> = Day<Tuesday>(day2)
    var v3: String = Day<Int32>.foo<String>("a")
    var v4: Monday = Day<Int32>.boo<Monday>(day1)
    var v5: Monday = Day<Int32>.coo<Tuesday>(day2)
    if (v1.d.d != 1 || v2.d.d != 2 || v3 != "a"  || v4.d != 1 || v5.d != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
     return run()
}

