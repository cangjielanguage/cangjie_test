// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T> {
    let x: T
    init(a: T){
        x = a
    }
}

record Test {
    func f(x: Foo<Int32>): Foo<Int32> { return x}
}

let res = Test()
var i: Int32 = 3
var foo = res.f(Foo<Int32>(i))
let res1 = foo.x

func run(): Int64 {
    if (res1 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}