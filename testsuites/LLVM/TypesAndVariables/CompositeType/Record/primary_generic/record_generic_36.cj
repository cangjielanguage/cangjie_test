// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo<T> {
    var dt: T
    init(x: T){
        dt = x
    }
}

record Data<T>
    where T <: Foo<Int32> {
    let classBar: T
    Data(x: T){
        classBar = x
    }
}

func run(): Int64 {
    var dt: Int32 = 3
    let foo: Foo<Int32> = Foo<Int32>(3)
    let data: Data<Foo<Int32>> = Data<Foo<Int32>>(foo)
    var classFoo: Foo<Int32> = data.classBar
    var res: Int32 = classFoo.dt
    if (res == 3) { 
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
