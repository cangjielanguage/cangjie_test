// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

class Data {
    var a1 : Int32
  var a2 : String
    init()  {    // EXPECTED: regex the uninitialized member variable 'a1' is not initialized in the constructor of class or record
    }
}

func run(): Int64 {
    var value : Data = Data();
    var r1: Int32 = value.a1
    var r2: String = value.a2

    return 1
}

func main(): Int64 {
    return run()
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
