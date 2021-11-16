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

enum RecordUnit { DataRecord(Int32) }


func run(): Int64 {
    let dataRecord: RecordUnit = RecordUnit.DataRecord(2)
    var data: Data = match (dataRecord) {
        case DataRecord(x) => Data(x, x+2)
    }
    var width: Int32 = data.width
    var length: Int32 = data.length
    if (width == 2 && length == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
