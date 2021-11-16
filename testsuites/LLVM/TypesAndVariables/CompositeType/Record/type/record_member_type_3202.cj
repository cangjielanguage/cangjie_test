// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T> {
    let x: T
    init(a: T){
        x = a
    }
}

record Test {
    let foo: Foo<Int32>
    init(x: Foo<Int32>) {
        foo = x
    }
}



func run(): Int64 {
    var i: Int32 = 3
    let test = Test(Foo<Int32>(i))
    var foo = test.foo
    let res = foo.x
    if (res == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}