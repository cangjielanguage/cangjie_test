// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int = Int32
type str = String

func foo(x: int, y: str): int {
    return x
}

func main(): Int64 {
    var i: int = 3
    let s: str = "hi"
    var res: int = foo(i, s)
    if (res == 3) {
        return 0
    }
    return 1
}