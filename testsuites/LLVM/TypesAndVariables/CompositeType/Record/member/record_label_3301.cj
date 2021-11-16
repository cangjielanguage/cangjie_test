// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data{
    var v1: Int32 = 1
    var v2: Int32 = v1
    init(x: Int32, y: Int32) {
    }
    func area(): Int32 {
        var res :Int32 = 3
        return res
    }
}
func run(): Int64 {
    var a: Int32 = 5
    var b: Int32 = 6
    let data: Data = Data(a, b)
    var res: Int32 = data.area()
    if (res == 3){
        return 0
    }
     return 1
}


