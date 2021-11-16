// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int = Int32

record Data {
    let a: int
    init(x: Int32, y: String){
        a = x
    }
    func getA(x: int): int{
        return a+x
    }
}

func main(): Int64 {
    var data: Data = Data(2, "hi")
    var res: int = data.getA(3)
    if (res == 5) {
        return 0
    }
    return 1
}