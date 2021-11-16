// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1|compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Data {       // EXPECTED: regex value type recursive detected: 'Data->Data'
    let width: Int32
    let length: Int32
    var data: Data = Data(2, 3,"2")
    Data(x: Int32, y:Int32, str:String) {
        width = x
        length = y
    }
}


func run(): Int64 {
    var data = Data(2, 3,"1").data
    return 0
}

func main(): Int64 {
    return run()
}
