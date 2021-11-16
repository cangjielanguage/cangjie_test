// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 |compare %f
// ASSERT: regex-auto LoopRecordTest: wid=1
// ASSERT: regex-auto LoopRecordTest: wid=2
// ASSERT: regex-auto LoopRecordTest: width=0
// ASSERT: regex-auto LoopRecordTest: width=1
// ASSERT: regex-auto LoopRecordTest: width=2
// ASSERT: regex-auto LoopRecordTest: width=3
// ASSERT: regex-auto LoopRecordTest: width=4

record Data {
    let wid: Int32
    let leng: Int32
    let width: Int64
    let length: Int64
    Data(x: Int32, y:Int32){
        wid = x
        leng = y
        width = 10
        length = 20
    }
    init(x:Int64,y:Int64){
        wid = 100
        leng = 200
        width = x
        length = y
    }
}

func run(): Int64 {
    var data: Data
    var rows: Array<Int32> = @{2, 3}
    for (index in rows) {
        data = Data(index-1, index+1)
        print("LoopRecordTest: wid=" + data.wid.toString() + "\n")
    }
    for (index in 0..10:1) {
        data = Data(index, index+1)
        if (index == 5) {
            break
        }
        print("LoopRecordTest: width=" + data.width.toString() + "\n")
    }
    return 0
}

func main(): Int64 {
    return run()
}
