// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-auto generics type arguments do not match the constraint
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Foo {
    var dt: Int32 = 3
}

class Bar<T> <: Foo {
    var dt: T
    init(x: T){
        dt = x
    }
}

enum Time<T>
    where T <: Bar<Int32>{
    Day(T)
}

func run(): Int32 {
    var foo: Foo = Foo()
    var time = Time<Foo>.Day(foo)
    var res: Int32 = match (time) {
        case Day(x) => x.dt
    }
    if (res == 3) {
        return 0
    }
    return 1
}

func main(): Int32 {
    return run()
}
