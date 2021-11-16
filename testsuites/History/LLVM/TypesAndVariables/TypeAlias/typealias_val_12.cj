// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Base<T> {
    var b: T
    init(x: T, y: str){
        b = x
    }
}

type int = Int32
type str = String
type B<T> = Base<T>

interface I {
    let i: int = 2
    let s: str = "hi"
    let base: B<Int32> = Base<Int32>(i, s)
    static func foo(x: B<Int32>): int {
        return x.b
    }
}

func main(): Int64 {
    var res: int = I.foo(I.base)
    if res == 2 {
        return 0
    }
    return 1
}