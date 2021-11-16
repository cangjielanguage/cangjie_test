// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan enum_generic_constraint_13_plus02
open class Foo1 {
    var dt: Int32 = 2
}

open class Foo2 {
    var dt: Int32 = 3
}

class Bar1 <: Foo1 {
    var dt: Int32 = 4
}
class Bar2 <: Foo2 {
    var dt: Int32 = 5
}

enum Time<T1,T2>
    where T1 <: Foo1, T2 <: Unit{
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var bar1: Bar1= Bar1()
    var bar2: Bar2= Bar2()
    // update: can not infer T2 is Unit.
    // Enum此处推导的类型是Time<Bar1,Unit>.Day(bar1)这里的unit刚好跟定义处的T2<:Unit契合
    var time1  = Time.Day(bar1)
    var res1: Int32 = match (time1) {
        case Day(x) => x.dt
        case Hour(x) => if(x!=()){ x.dt }else{0}
    }
    if (res1 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
