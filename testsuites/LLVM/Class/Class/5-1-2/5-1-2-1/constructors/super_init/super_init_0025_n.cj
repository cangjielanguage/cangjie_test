// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex the uninitialized member variable 'a' is not initialized in the constructor of class or record
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    var a: Int32
}

class Data <: Base {

}

func run(): Int64 {
    var data: Data = Data()
    return 0
}

func main(): Int64 {
    return run()
}
