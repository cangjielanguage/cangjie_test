// ERRCHECK: %compiler -frontend -typecheck %cmp_opt %n.cj

open class Foo<T> {
    var dt: T
    init(x: T){
        dt = x
    }
}

class Bar <: Foo<Bar> {
    var dt: Int32 = 23
    init() { super(Bar()) } // EXPECTED: regex recursive constructor calling in class 'Bar'
}

enum Time<T>
    where T <: Foo<T> {
    Day(T)
}

func run(): Int64 {
    let bar: Bar= Bar()
    var time = Time<Bar>.Day(bar)
    var res: Int32 = match (time) {
        case Day(x) => x.dt
    }
    if (res == 23) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
