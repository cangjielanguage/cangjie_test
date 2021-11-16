// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record DataRec {
    var width: Int32 = 3
}

class Data<T> {
    let rec: T
    init(x: T){
        rec = x
    }
}

func run(): Int64 {
    let dataRec: DataRec = DataRec()
    let data: Data<DataRec> = Data<DataRec>(dataRec)
    var res: DataRec = data.rec
    if (res.width == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
