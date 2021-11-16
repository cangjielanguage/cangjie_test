// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Base<T> {
    var b: T
    init(x: T, y: Int32){
        b = x
    }
}

type int = Int32
type str = String
type B<T> = Base<T>

func foo(x: B<int>, y: str): String {
    return x.b.toString() + y
}

func main(): Int64 {
    var i: int = 3
    var base: B<int> = Base<Int32>(i, 3)
    let s: str = "hi"
    var res: str = foo(base, s)
    if (res == "3hi") {
        return 0
    }
    return 1
}
