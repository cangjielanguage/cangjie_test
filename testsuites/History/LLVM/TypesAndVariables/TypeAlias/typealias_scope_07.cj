// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int = Int32

interface I {
    let i: int = 2
    static func foo(x: int): int{
        return x
    }
}

func main(): Int64 {
    var res1: Int32 = I.i
    var res2: int = I.foo(3)
    if res1 == 2 && res2 == 3 {
        return 0
    }
    return 1
}