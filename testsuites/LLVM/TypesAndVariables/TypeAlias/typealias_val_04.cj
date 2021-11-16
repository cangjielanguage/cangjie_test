// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int = Int32
type str = String

class Data {
    var a: int = 0
    init() {}
    init(x: int, y: String){
        this()
        a = x
    }
    func foo(x: int): str{
        return x.toString()
    }
}

func main(): Int64 {
    var i: int = 3
    let s: str = "hi"
    var data: Data = Data(i, s)
    var res1 = data.a
    var res2 = data.foo(2)
    if (res1 == 3 && res2 == "2") {
        return 0
    }
    return 1
}
