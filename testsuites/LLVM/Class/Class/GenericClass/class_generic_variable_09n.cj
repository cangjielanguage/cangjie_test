// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base<T> {}

class Data<T> <: Base<Int32> {
    static var f: T   // EXPECTED: regex static variable 'f' needs to be initialized when declaring
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    return 0
}