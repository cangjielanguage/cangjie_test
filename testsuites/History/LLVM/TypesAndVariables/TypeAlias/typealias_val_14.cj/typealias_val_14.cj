// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int = Int32
type str = String
type B<T> = Base<T>

class Base<T> {
    var b: T
    init(x: T, y: str){
        b = x
    }
}

trait Num{
    func choose(x: This, y: This): int
}

append B<int> with Num {
    func choose(x: B<int>, y: B<int>): int {
        return y.b
    }
}

func main(): Int64 {
    var base1: B<int> = Base<int>(3, "hi")
    var base2: B<int> = Base<int>(4, "hello")
    var res: int = choose(base1, base2)
    if (res == 4) {
        return 0
    }
    return 1
}