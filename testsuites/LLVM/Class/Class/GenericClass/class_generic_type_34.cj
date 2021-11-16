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
    var foo: Foo<Int32> = Foo<Int32>(1, 2)
    var tup: Int32*Foo<Int32> = (1, foo)
    var getFoo: Foo<Int32> = tup[1]
    var res1: Int32 = getFoo.x
    var res2: Int32 = getFoo.y
    var res3: Int32 = tup[0]
    if (res1 == 1 && res2 == 2 && res3 == 1){
        return 0
    }
    return 1
}
