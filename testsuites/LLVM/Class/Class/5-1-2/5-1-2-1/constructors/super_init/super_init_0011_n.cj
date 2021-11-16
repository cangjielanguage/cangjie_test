// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

open class Base {
    var a : Int32 = 100
    var b : Float32  = 10.0
}

class Data <: Base {
    var c : Int32
    var d : Int32
    var e : Int32
    init(value1 : Int32, value2 : Int32) { // EXPECTED: regex recursive constructor calling detected
        this(value1)
        c = 1
        d = 2
    }

    init(value1 : Int32) { // EXPECTED: regex recursive constructor calling detected
        this(value1, 4)
    }

    init() {
        this(3)
    }
}



func run(): Int64 {
    var res: Data = Data()
    return 1
}

func main(): Int64 {
    return run()
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
