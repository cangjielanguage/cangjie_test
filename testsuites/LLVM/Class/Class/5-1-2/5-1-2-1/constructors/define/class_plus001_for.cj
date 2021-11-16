// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    let width: Int32
    let length: Int32
    init(x: Int32, y:Int32){
        width = x
        length = y
    }
}
func run(): Int64 {
    var data: Data
    var width: Int32 = 0
    var length: Int32 = 0
    let rows:Array<Int32> = @{2}
    for (number in rows) {
        data = Data(number, number)
        print(data.width.toString()+"\n")
        width = data.width
        length = data.length
    }
    if (width == 2 && length == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
