// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f

open class Base {
    var a : Int32 = 100
    var b : Float32  = 10.0
}

class Data <: Base {
    var c : Int32 = 1
    var d : Int32 = 2
    var e : Int32 = 3
    init(value1 : Int32, value2 : Int32) { // EXPECTED: regex recursive constructor calling detected
        this(value1)
    }

    init(value1 : Int32) {
        this(value1, 4)
    }
    init() {
        this(3)
    }
}

func run(): Int64 {
    var c : Data = Data()
    return 0
}

func main(): Int64 {
    return run()
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
