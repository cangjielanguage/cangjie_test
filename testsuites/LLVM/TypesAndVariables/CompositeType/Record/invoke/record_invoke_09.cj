// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data {
    let width: Int32
    let length: Int32
    init(x: Int32, y:Int32){
        width = x
        length = y
    }
}

func run(): Int64 {
    var getData: ()->Data = {  => Data(3, 2)}
    var data: Data = getData()
    var width: Int32 = data.width
    var length: Int32 = data.length
    if (width == 3 && length == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
