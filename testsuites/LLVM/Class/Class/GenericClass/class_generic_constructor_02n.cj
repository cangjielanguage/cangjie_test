// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base<T> {
    var a: Int32 = 1
}

class Data<T> <: Base<Int32> {
    var f: T
    init(){}       // EXPECTED: regex the uninitialized member variable 'f' is not initialized in the constructor of class or record
}


func run(): Int64 {
    var data: Data<Int64> = Data<Int64>()
    return 0
}

func main(): Int64 {
    return run()
}