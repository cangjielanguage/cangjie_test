// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data {
    public func area(): Int32 {
        return 2
    }
}

func run(): Int64 {
    let data: Data= Data()
    var res: Int32 = data.area()
    if (res == 2){
        return 0
    }
    return 1
}