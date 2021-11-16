// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int = Int32
type str = String

trait Num{
    func add(x: This, y: This): str
}

append int with Num {
    func add(x: int, y: int): str {
        return (x+y).toString()
    }
}

func main(): Int64 {
    var i1: int = 2
    var i2: int = 3
    var res: str = add(i1,i2)
    if (res == "5") {
        return 0
    }
    return 1
}