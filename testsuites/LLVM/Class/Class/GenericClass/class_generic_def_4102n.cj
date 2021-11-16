// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
    return run()
}

class Data<T,V>{
    var width: T
    var length: V
    init(widthin: T){
        width = widthin
        area()
    }
    func area(x: T): T{
        width = x
        length = width //EXPECTED: regex type incompatible in this assignment
        return length
    }
}

func run(): Int64 {
    var i1: Int32 = 3
    let data = Data<Int32>(i1)
    return 0
}
