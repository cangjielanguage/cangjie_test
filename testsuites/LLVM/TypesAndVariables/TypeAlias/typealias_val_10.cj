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

func foo<T>(x: T, y: str): B<T> {
    var b: B<T> = Base<T>(x, y)
    return b
}

func main(): Int64 {
    var i: int = 3
    let s: str = "hi"
    var b: B<int> = foo<int>(i, s)
    if (b.b == 3) {
        return 0
    }
    return 1
}