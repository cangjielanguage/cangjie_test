// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    var dt: Int32 = 2
}

class Data<T1>
    where T1 <: Foo {
    var classFoo: T1
    init(x: T1){
        classFoo = x
    }
}

func run(): Int64 {
    let foo: Foo= Foo()
    let data: Data<Foo> = Data<Foo>(foo)
    var classFoo: Foo = data.classFoo
    var res: Int32 = classFoo.dt
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
