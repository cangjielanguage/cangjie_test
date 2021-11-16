// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 |compare %f
// ASSERT: regex-auto LoopClassTest: width=1
// ASSERT: regex-auto LoopClassTest: length=3
// ASSERT: regex-auto LoopClassTest: width=2
// ASSERT: regex-auto LoopClassTest: length=4

class Data<T> {
    let width: T
    let length: T
    init(x: T, y: T){
        width = x
        length = y
    }
}

func run(): Int64 {
    var data: Data<Int32>
    var rows: Array<Int32> = @{2, 3}
    for (index in rows) {
        data = Data<Int32>(index-1, index+1)
        print("LoopClassTest: width=" + data.width.toString() + "\n")
        print("LoopClassTest: length=" + data.length.toString() + "\n")
    }
    return 0
}

func main(): Int64 {
    return run()
}
