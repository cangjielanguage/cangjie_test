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

let data: Data = Data(2, 3)
var width: Int32 = data.width
var length: Int32 = data.length

func run(): Int64 {
    if ( width == 2 && length == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
