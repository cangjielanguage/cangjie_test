// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record DataRec<T> {
    let width: T
    init(x: T){
        width = x
    }
}

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    let dataRec: DataRec<Int32> = DataRec<Int32>(4)
    var time = Time.Day(dataRec)
    var res: Int32 = match (time) {
        case Day(x) => x.width
    }
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
