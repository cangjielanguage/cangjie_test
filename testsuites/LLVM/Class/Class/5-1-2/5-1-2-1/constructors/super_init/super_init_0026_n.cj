// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    var a: Int32
    init(){  // EXPECTED: regex the uninitialized member variable 'a' is not initialized in the constructor of class or record
    }
}

class Data <: Base {

}

func run(): Int64 {
    var data: Data = Data()
    var res: Int32 = data.a
    return 0
}

func main(): Int64 {
    return run()
}
