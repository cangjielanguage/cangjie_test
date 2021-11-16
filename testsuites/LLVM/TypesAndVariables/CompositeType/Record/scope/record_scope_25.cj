// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data {
    public var width: Int32 = 1
    public var length: Int32 =2
}

func run(): Int64 {
    let data: Data= Data()
    var res1: Int32 = data.width
    var res2: Int32 = data.length
    if (res1 == 1 && res2 == 2){
        return 0
    }
    return 1
}
