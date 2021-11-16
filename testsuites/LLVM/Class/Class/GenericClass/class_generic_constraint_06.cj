// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T> {
    var dt: T
    init(x: T){
        dt = x
    }
}

class Data<T1>
    where T1 <: Foo<Int32> {
    var classFoo: T1
    init(x: T1){
        classFoo = x
    }
}

func run(): Int64 {
    var dt: Int32 = 3
    let foo: Foo<Int32> = Foo<Int32>(3)
    let data: Data<Foo<Int32>> = Data<Foo<Int32>>(foo)
    var classFoo: Foo<Int32> = data.classFoo
    var res: Int32 = classFoo.dt
    if (res == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
