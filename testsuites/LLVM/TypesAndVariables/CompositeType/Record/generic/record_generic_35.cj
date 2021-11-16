// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo<T> {
    var dt1: Int32 = 1
}

class Bar <: Foo<Int32> {
    var dt: Int32 = 23
}

record Data<T>
    where T <: Foo<Int32> {
    let classBar: T
    init(x: T){
        classBar = x
    }
}

func run(): Int64 {
    let bar: Bar= Bar()
    let data: Data<Bar> = Data<Bar>(bar)
    var classBar: Bar = data.classBar
    var res: Int32 = classBar.dt
    if (res == 23) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
