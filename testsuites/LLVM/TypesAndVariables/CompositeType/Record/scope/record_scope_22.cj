// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data {
    static let width: Int32 = 1
    static let length: Int32 =2
}

func run(): Int64 {
    var width: Int32 = Data.width
    var length: Int32 = Data.length
    if (width == 1 && length ==2){
        return 0
    }
    return 1
}