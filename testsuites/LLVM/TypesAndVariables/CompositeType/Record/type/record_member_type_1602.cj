// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface Foo<T> {
    func x(): Int32 {3}
}

class B<:Foo<Int32>{}

record Test {
    static let I: Foo<Int32> = B()
}

func run(): Int64 {
    let I = Test.I
    let res1 = I.x()
    if (res1 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
