// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }

}

class Data<T> <: Base<T> {
    static var foo: (T)->T   // EXPECTED: regex  static variable 'foo' needs to be initialized when declaring
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    return 0
}