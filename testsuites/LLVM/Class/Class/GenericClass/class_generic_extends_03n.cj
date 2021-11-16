// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base<T> {
    var b: Int32 = 4
}

class Data <: Base { // EXPECTED: regex generic type should be used with type argument
    var a: Int32 = 2
}

func main(): Int32 {
    var data: Data = Data()
    return 0
}
