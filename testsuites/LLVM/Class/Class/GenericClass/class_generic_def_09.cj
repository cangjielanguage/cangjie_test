// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo {
    var dt: Int32 = 2
}

class Bar <: Foo {}

class Data<T>
    where T <: Foo {
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
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
