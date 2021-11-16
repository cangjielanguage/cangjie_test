// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    var a : Int32  = 100
    var b : Float32
    init()  {   // EXPECTED: regex the uninitialized member variable 'b' is not initialized in the constructor of class or record

    }
}

func run(): Int64 {
    var value : Data = Data();
    var r1: Int32 = value.a
    var r2: Float32 = value.b
    return 1
}

func main(): Int64 {
    return run()
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
