// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T> {
    var a: T
    Foo(a1: T){
        a = a1
    }
}

record Data<T> {
    let classFoo: T
    Data(x: T){
        classFoo = x
    }
}

func run(): Int64 {
    let foo: Foo<Int32>= Foo<Int32>(3)
    let data: Data<Foo<Int32>> = Data<Foo<Int32>>(foo)
    var classFoo: Foo<Int32> = data.classFoo
    var res = classFoo.a
    if (res == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
