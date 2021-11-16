// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


record Data {
    init {
        var x: Int32
        var y: Int32
        let a: Int32 = 1
        let b: Int32 = 2
        let c: Int32 = 3
        var z: Int32        // EXPECTED: regex xxx
    }
}

func run(): Int64 {
    var data : Data = Data(4,5)
    if (data.c == 3 && data.x == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
