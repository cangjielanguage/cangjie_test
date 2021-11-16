// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record RecordData {
    var i: Int32 = 2
}

type RD = RecordData

func main(): Int64 {
    var record1: RD = RecordData()
    var record2: RecordData = RecordData()
    if (record1.i == record2.i) {
        return 0
    }
    return 1
}
