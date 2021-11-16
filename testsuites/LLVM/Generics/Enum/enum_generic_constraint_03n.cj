// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-auto generics type arguments do not match the constraint
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Foo {
    var dt: Int32 = 2
}

class Bar <: Foo {
    var dt: Int32 = 4
}

enum Time<T>
    where T <: Bar{
    Day(T)
}

func run(): Int64 {
    var foo: Foo= Foo()
    var time = Time<Foo>.Day(foo)
    var res: Int32 = match (time) {
        case Day(x) => x.dt
    }
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}