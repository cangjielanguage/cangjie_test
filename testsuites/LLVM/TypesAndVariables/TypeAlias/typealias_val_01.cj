// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int = Int32
type str = String

func foo(x: int, y: str): String {
    return x.toString() + y
}

func main(): Int64 {
    var i: int = 3
    let s: str = "hi"
    var res: str = foo(i, s)
    if (res == "3hi") {
        return 0
    }
    return 1
}