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

class Data<V> {
    var a: B<V>
    init(x: B<V>, y: str){
        a = x
    }
    func foo(x: B<V>): V{
        return x.b
    }
}

func main(): Int64 {
    var i: int = 3
    let s: str = "hi"
    var b: B<int> = Base<int>(i, s)
    var data: Data<int> = Data<int>(b, s)
    var res1 = data.a.b
    var res2 = data.foo(b)
    if (res1 == 3 && res2 == 3) {
        return 0
    }
    return 1
}