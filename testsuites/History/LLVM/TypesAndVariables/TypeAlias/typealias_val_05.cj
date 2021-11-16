// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int = Int32
type str = String

interface I {
    let a: int = 3
    static func foo(x: int): str{
        return x.toString()
    }
}

func main(): Int64 {
    var res1: int = I.a
    var res2: str = I.foo(2)
    if res1 == 3 && res2 == "2" {
        return 0
    }
    return 1
}