// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Foo1 {
    var dt: Int32 = 2
}

open class Foo2 {
    var dt: Int32 = 3
}

class Bar1 <: Foo1 {
    // var dt: Int32 = 4
}
class Bar2 <: Foo2 {
    // var dt: Int32 = 5
}

enum Time<T1,T2>
    where T1 <: Foo1, T2 <: Foo2{
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var bar1: Bar1= Bar1()
    var bar2: Bar2= Bar2()
    var time1  = Time.Day(bar1)
    var time2  = Time.Hour(bar2)
    var res1: Int32 = match (time1) {
        case Day(x) => x.dt
        case Hour(x) => if(x!=()){ x.dt }else{0} //EXPECTED:regex error.*? '!=' is not a member of class 'Foo2'
    }
    var res2: Int32 = match (time2) {
        case Day(x) => if(x!=()){ x.dt } else {0}
        case Hour(x) => x.dt
    }
    if (res1 == 4 && res2 == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
