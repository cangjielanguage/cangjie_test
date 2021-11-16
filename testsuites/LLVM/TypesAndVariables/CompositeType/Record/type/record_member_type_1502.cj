// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T> {
    let x: T
    init(a: T) {
        x = a
    }
}

record Test {
    var i: Int32 = 3
    var classFoo: Foo<Int32> = Foo<Int32>(i)
}

func run(): Int64 {
    let res: Test = Test()
    var foo: Foo<Int32> = res.classFoo
    let res1: Int32 = foo.x
    if (res1 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
