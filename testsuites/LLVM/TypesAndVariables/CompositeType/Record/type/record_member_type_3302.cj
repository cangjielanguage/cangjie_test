// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface Foo<T> {
    func x(): Int32 {3}
}

class B<T> <: Foo<T>{}

record Test {
    let a: Foo<Int32>
    init(x: Foo<Int32>) {
        a = x
    }
}

func run(): Int64 {
    let res = Test(B<Int32>())
    let foo = res.a
    let res1 = foo.x()
    if (res1 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}