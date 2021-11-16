// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int = Int32

func foo(x: int): int{
    var i: int = 3
    return x + i
}

func main(): Int64 {
    var i1: Int32 = 1
    let i2: int = 2
    var res: int = foo(i1 + i2)
    if (res == 6) {
        return 0
    }
    return 1
}