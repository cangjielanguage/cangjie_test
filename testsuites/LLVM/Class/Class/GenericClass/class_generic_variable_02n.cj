// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }
}

class Data<T> <: Base<Int32> {
    var a: Int32
    var f: T
    init(x: Int32){
        a = x
    }
    init(){
        init(2)
        f = this.a  // EXPECTED: regex type incompatible in this assignment
    }

}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    return 0
}