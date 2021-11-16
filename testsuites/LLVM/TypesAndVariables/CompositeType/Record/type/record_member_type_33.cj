//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface Foo {
    func x(): Int32 { 3}
}

class Loo <: Foo {
    let y: Int32 = 4
}

record Test {
    let a: Foo
    init(x: Foo) {
        a = x
    }
}

let res = Test(Loo())
let foo = res.a
let res1 = foo.y // EXPECTED: regex-auto 'y' is not a member of interface 'Foo'

func run(): Int64 {
    if (res1 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
