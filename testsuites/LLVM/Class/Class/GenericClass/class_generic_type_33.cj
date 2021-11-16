// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Foo<T> {
    var x: T
    var y: T
    init(a: T, b: T){
        x = a
        y = b
    }
}

func run(): Int64 {
    var foo1: Foo<Int32> = Foo<Int32>(1, 2)
    var foo2: Foo<Int32> = Foo<Int32>(3, 4)
    var foo3: Foo<Int32> = Foo<Int32>(5, 6)
    var listFoo: List<Foo<Int32>> = [foo1, foo2, foo3]
    var foo3_1: Foo<Int32> = listFoo[2]
    var res1: Int32 = foo3_1.x
    var res2: Int32 = foo3_1.y
    if (res1 == 5 && res2 == 6){
        return 0
    }
    return 1
}
